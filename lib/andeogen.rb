require "andeogen/version"

module Andeogen
  class Andeogen

    attr_accessor :results

    def initialize
      @results = []
    end

    def root_path
      return @root_path unless @root_path.nil?
      dir = Dir.pwd
      dir = begin
        File.expand_path("..", dir)
      end until dir == "/" || !(Dir.open(dir).entries & ['.git', '.hg']).empty?
      @root_path = dir
    end

    def findpath(elem)
      Dir.chdir root_path do
        @results += Dir.glob("**/*#{elem.gsub(/@.+\//,'')}*")
                       .delete_if{|x| x.include?('.class')}
      end
    end

    def parse(files)
      files.map do |file|
        Nokogiri::XML(open(file).read).traverse do |elem|
          elem.attributes.map do |k,v|
            if !(v.value =~ /@android:/) &&
                    v.value =~ /\A@[style|layout|drawable|color].+\z/
              findpath(v.value)
            end
          end if elem.respond_to?(:attributes)
        end
      end
      self
    end

    def execute
      unless @results.empty?
        ap @results
        numbers = if @results.count == 1
          0
        else
          puts "Comma-separate the files' number you want to execute your <command> on:"
          gets.strip.split(',').map(&:to_i)
        end
        exec("#{OPTS[:command]} #{numbers.map{|x|
          "#{Shellwords.escape("#{root_path}/#{@results[x]}")}"}.join(" ")}")
      end
    end
  end

end
