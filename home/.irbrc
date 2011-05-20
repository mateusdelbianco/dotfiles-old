# -*- encoding:  utf-8 -*-
$KCODE = 'u' unless defined?(Encoding)
require 'rubygems'
require 'pp'

begin 
  require 'active_support/all'
rescue LoadError
  puts "activesupport missing. To use it you need to install activesupport gem."
end

begin
  require 'ap' # sudo gem install awesome_print
rescue LoadError
  puts "awesome_print missing. To use it you need to install awesome_print gem."
end

begin 
  require 'wirble' # sudo gem install wirble
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "Wirble missing. To use it you need to install wirble gem."
end

begin 
  require 'hirb' # sudo gem install hirb
  Hirb.enable :pager => false
rescue LoadError
  puts "Hirb missing. To use it you need to install hirb gem."
end

# lp any_object
begin
  require 'looksee' # sudo gem install looksee
rescue LoadError
  puts "Looksee missing. To use it you need to install looksee gem."
end

begin
  require 'sketches'
  Sketches.config :editor => 'mate'
rescue LoadError
  puts "Sketches missing. To use it you need to install sketches gem."
end

alias q exit
IRB.conf.merge! :PROMPT_MODE  => :SIMPLE, :AUTO_INDENT  => true