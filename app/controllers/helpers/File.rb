# To make the file upload and download~
def upload(file_temp, path)
  begin
    content = file_temp.read
    @filename = file_temp.original_filename
    @filename_n = Time.now.to_s
    File.open('public/uploads/' + path + '/' + @filename_n, 'wb') { |f| f.write(content)}
  rescue Exception => e
    puts 'Error in uploadfile in ' + path
  end
  return @filename, @filename_n
end

def destroy_file(file_temp, path)
  begin
    File.delete('public/uploads/' + path + '/' + file_temp)
  rescue Exception => e
    puts 'Error in delete file'
  else
    puts 'Successfully delete the file'
  end
end

def download_file(file_name, control_type)
  io = File.open('/public/uploads/' + control_type + '/' + file_name)
  io.binmod
  send_data(io.read,
            :filename => params[:filename],
            :disposition => 'inline'
          )
  io.close
end

def download(file_name, control_type)
  send_file 'public/uploads/' + control_type + '/' + file_name unless file_name.blank?
end
