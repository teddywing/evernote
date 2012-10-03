module Evernote
  class NoteStore
    def initialize(notestore_url, access_token)
      notestore_transport = Thrift::HTTPClientTransport.new(notestore_url)
      notestore_protocol = Thrift::BinaryProtocol.new(notestore_transport)
      @notestore = Evernote::EDAM::NoteStore::NoteStore::Client.new(notestore_protocol)
      @access_token = access_token
    end
    
    # Camelize the method names for ruby consistency and push the access_token to the front of the args array
    def method_missing(name, *args, &block)
      @notestore.send(name.to_s.camelize(:lower), *(args.unshift(@access_token)), &block)
    end
  end
end
