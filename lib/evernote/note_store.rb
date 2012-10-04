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
        books
      end
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
    
    def all(rows = max)
      @filter = NoteFilter.new
      @filter.notebook_guid = notebook.guid
      @notes = wrap_notes(notestore.find_notes(filter, offset, rows).notes)
    end
    
    def updated_since(time, rows = max)
      @filter = NoteFilter.new(:notebook_guid => notebook.guid, :words => "updated:#{time.strftime(DATE_FORMAT)}")
      @notes = wrap_notes(notestore.find_notes(filter, offset, rows).notes)
    end
    
    def created_since(time, rows = max)
      @filter = NoteFilter.new(:notebook_guid => notebook.guid, :words => "created:#{time.strftime(DATE_FORMAT)}")
      @notes = wrap_notes(notestore.find_notes(filter, offset, rows).notes)
    end
    
    def method_missing(name, *args, &block)
      @notebook.send(name.to_s.camelize(:lower), *args, &block)
    end
    
  private
    def wrap_notes(notes)
      notes.inject([]) do |notes, note|
        notes.push Note.new(notestore, note)
        notes
      end
    end
    
  end
  
  class Note
    attr_reader :notestore, :note
    
    def initialize(notestore, note)
      @notestore = notestore
      @note = note
    end
    
    def content(options = :all)
      @content ||= notestore.get_note(*args_from(options).unshift(note.guid))
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
      note.resources || []
    end
    
    def method_missing(name, *args, &block)
      @note.send(name.to_s.camelize(:lower), *args, &block)
    end
    
  private
    def args_from(options)
      if options == :all
        return true, true, false, false
      elsif options == :enml
        return true, false, false, false
      else
        return true, false, false, false
      end
    end
    
  end
  
  class NoteFilter
    attr_reader :filter
    
    def initialize(options = {})
      @filter = Evernote::EDAM::NoteStore::NoteFilter.new
      options.each do |method, value|
        @filter.send "#{method}=", value
      end
    end
    
    def method_missing(name, *args, &block)
      @filter.send(name.to_s.camelize(:lower), *args, &block)
    end
  end
  
  
end
