class UploadController < ApplicationController
    skip_before_filter  :verify_authenticity_token
     
      #def upload
      #  post = Problem.save(params[:upload])
      #  render :text => "File has been uploaded successfully"
      #end  
     
      def upload()
      question_open = false
      p = Problem.new
      puts params["myfile"].original_filename
      puts "PASS PASS PASS PASS"
      File.open(params["myfile"].tempfile, 'r') do |f1|
        puts 'here'
        while line = f1.gets
        puts line
          #next if line =~ /\s*quiz*/
          if question_open
            if not line =~ /\s*end.*/
                    p.text << line
                    #puts line
                    question_open = true
            else
                    p.instructor = @current_user
                    puts "HERE "
                    puts "HERE "
                    puts "HERE "
                    puts "HERE "
                    puts "HERE "
                    puts "HERE "
                    puts "HERE"
                    puts p.instructor.id.to_s
                    p.save!
                    p = Problem.new
                    puts line
                    question_open = false
            end
          else
            if line =~ /\s*truefalse.*/
                    #puts line
                    p.text = line
                    p.instructor = @current_user
                    p.save!
                    p = Problem.new
              question_open = false
            elsif line =~ /\s*fill_in.*/
              question_open = true
              p.text = line
                #puts line
            elsif line =~ /\s*choice.*/
             
              p.text = line
              question_open = true
             
                #p.text = line
                #puts line
            elsif line =~ /\s*select_multiple.*/
             
              question_open = true
             
              p.text = line
                #puts line
            end
          end
        end
      end
    render 'complete'  
    end
end