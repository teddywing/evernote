require 'rubygems'

thrift_path = File.expand_path(File.dirname(__FILE__) + "/../vendor")
$LOAD_PATH.unshift thrift_path
require 'thrift'

gen_rb_path = File.expand_path(File.dirname(__FILE__) + "/../vendor/gen-rb")
$LOAD_PATH.unshift gen_rb_path
$LOAD_PATH.unshift "#{gen_rb_path}/evernote/edam"
require "#{gen_rb_path}/evernote"
require "evernote/user_store"
require "evernote/note_store"
