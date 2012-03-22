
    
# Dumps rspec results as a JUnit XML file.
# Based on XML schema: http://windyroad.org/dl/Open%20Source/JUnit.xsd
# Modified By Hibat Allah OUNIFI ( hibat.allah.batoul@gmail.com)


class RSpec::Core::Formatters::JUnitFormatter < RSpec::Core::Formatters::BaseFormatter
  def xml
    @xml ||= Builder::XmlMarkup.new :target => output, :indent =>5
   
  end
 
  def start example_count
    @start = Time.now
    super
  end

 def description


 end



  def dump_summary duration, example_count, failure_count, pending_count


    super
   
    xml.instruct!
   
    xml.testsuite :tests => example_count, :failures => failure_count, :errors =>0, :time => '%.6f' % duration, :timestamp => @start.iso8601 do |example|
        
        example.testcase :classname =>example_group.description  do

        examples.each do |example|
       
        send :"dump_summary_example_#{example.execution_result[:status]}", example 
 end 
 
end



  end

  end
 


 

def xml_example example ,&block
 
xml.step :step_name =>example.description , :time => '%.6f' % example.execution_result[:run_time],:testcase_name=>example_group.description,:status => example.execution_result[:status],&block
end




  def dump_summary_example_passed example ,&block
 
   xml_example example
   

end

 
  def dump_summary_example_pending example 
  
    xml_example example do
      xml.skipped
  
  end
end
 
  def dump_summary_example_failed example ,&block
    
    exception = example.execution_result[:exception]
    backtrace = format_backtrace exception.backtrace, example

   

    xml_example example do
      
       
        xml.failure :message => exception.to_s, :type => exception.class.name do
      xml.cdata! "#{exception.message}\n#{backtrace.join "\n"}"
      #xml.message :message => exc.exception(got)
      #xml.message :message =>exception.pretty_inspect
     
      #xml.test :test=>exception.to_str
      data = "#{exception.message}"
      data.grep(/^expected/)
      data.grep(/got$/)
     
      #str2=data.sub(/(got:)$/,"(using==)")
   
      xml.expected :expected=>data.grep(/^expected/)
      xml.got :got=>data.grep(/got:/)
      xml.test:test=>data.gsub!(/using ==/,"")
      #xml.test:test=>str2
      
end

      end
 
    end
  end
