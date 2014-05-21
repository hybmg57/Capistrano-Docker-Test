class SetupFunctions
  def self.sed_search_and_replace(search_replace, file_path)
    file_string = File.read(file_path).downcase
    search_replace.each do |search_replace|
      if file_string.include?(search_replace[0].downcase)
        system "sudo sed -i 's/" + search_replace[0] + "/" + search_replace[1] + "/g' " + file_path
      else
        return false
      end
    end
    return true
  end
end