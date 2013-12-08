# Needed for camelize
require 'active_support/core_ext/string/inflections'

module Evernote
  class NoteStore
    attr_reader :access_token, :notestore
    
    def initialize(notestore_url, access_token)
      notestore_transport = Thrift::HTTPClientTransport.new(notestore_url)
      notestore_protocol = Thrift::BinaryProtocol.new(notestore_transport)
      @notestore = Evernote::EDAM::NoteStore::NoteStore::Client.new(notestore_protocol)
      @access_token = access_token
    end
    
    def notebooks(*args)
      @notebooks ||= list_notebooks(*args).inject([]) do |books, book|
        books.push Notebook.new(self, book)
      end
    end
    
    def update_count
      sync_state.updateCount
    end
    
    def sync_state
      @sync_state ||= self.get_sync_state
    end
    
    # Camelize the method names for ruby consistency and push the access_token to the front of the args array
    def method_missing(name, *args, &block)
      @notestore.send(name.to_s.camelize(:lower), *(args.unshift(@access_token)), &block)
    end
  end
  
  class Notebook
    attr_reader :notestore, :notebook, :offset, :max, :filter
    DATE_FORMAT = '%Y%m%dT%H%M%S%z'
    
    def initialize(notestore, notebook)
      @notestore = notestore
      @notebook = notebook
      @offset = 0
      @max    = 100
    end

    def notes
      @notes || all
    end
    
    # TODO turn filter params into options
    # where(:created => 'since', :updated => 'since', :words => '.....')
    # ie. mimic the AR interface as much as practical
    def all(rows = max)
      @filter = NoteFilter.new
      @filter.notebook_guid = notebook.guid
      @notes = wrap_notes(notestore.find_notes(filter.filter, offset, rows).notes)
    end
    
    def updated_since(time, rows = max)
      @filter = NoteFilter.new(:notebook_guid => notebook.guid, :words => "updated:#{time.strftime(DATE_FORMAT)}")
      @notes = wrap_notes(notestore.find_notes(filter.filter, offset, rows).notes)
    end
    
    def created_since(time, rows = max)
      @filter = NoteFilter.new(:notebook_guid => notebook.guid, :words => "created:#{time.strftime(DATE_FORMAT)}")
      @notes = wrap_notes(notestore.find_notes(filter.filter, offset, rows).notes)
    end
    
    def method_missing(name, *args, &block)
      @notebook.send(name.to_s.camelize(:lower), *args, &block)
    end
    
  private
    def wrap_notes(notes)
      notes.inject([]) do |notes, note|
        notes.push Note.new(notestore, note)
      end
    end
    
  end
  
  class Note
    attr_reader :notestore, :note
    
    def initialize(notestore, note)
      @notestore = notestore
      @note = note
    end

    def content(options = :enml)
      @content ||= content!(options)
    end
    
    def content!(options = :enml)
      @content = notestore.get_note(*args_from(options).unshift(note.guid))
    end
    
    def enml
      content.content
    end

    def created
      @created ||= Time.at(note.created / 1000)
    end
    
    def updated
      @updated ||= Time.at(note.updated / 1000)
    end
    
    def latitude
      note.attributes.latitude
    end
    
    def longitude
      note.attributes.longitude
    end
    
    def resources
      @resources ||= note.resources.inject([]) do |resources, resource|
        resources.push Resource.new(notestore, resource)
      end rescue []
    end
    
    def tags
      @tags ||= notestore.get_note_tag_names(note.guid)
    end
    
    def method_missing(name, *args, &block)
      @note.send(name.to_s.camelize(:lower), *args, &block)
    end
    
  private
    # Arguments are with_data, with_recognition, with_attributes, with_alternate_data
    def args_from(options)
      options = :enml unless [:enml, :all].include?(options)
      case options
      when :all
        [true, true, false, false]
      when :enml
        [true, false, false, false]
      end
    end
  end
  
  class Resource
    attr_reader :notestore, :resource
    WITH_DATA           = true
    WITH_RECOGNITION    = false
    WITH_ATTRIBUTES     = false
    WITH_ALTERNATE_DATA = false
    
    def initialize(notestore, resource)
      @notestore = notestore
      @resource = resource
    end
    
    def body
      @body ||= resource.data.body || 
                notestore.get_resource(self.guid, WITH_DATA, WITH_RECOGNITION, WITH_ATTRIBUTES, WITH_ALTERNATE_DATA).data.body
    end
    
    def mime_type
      defined?(Mime::Type) ? Mime::Type.lookup(self.mime) : self.mime
    end
    
    def method_missing(name, *args, &block)
      @resource.send(name.to_s.camelize(:lower), *args, &block)
    end    
  end
  
  class NoteFilter
    attr_reader :filter
    
    def initialize(options = {})
      @filter = Evernote::EDAM::NoteStore::NoteFilter.new
      options.each do |method, value|
        send "#{method}=", value
      end
    end
    
    def method_missing(name, *args, &block)
      @filter.send(name.to_s.camelize(:lower), *args, &block)
    end
  end
  
  
end
