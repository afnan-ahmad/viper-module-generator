module Vipergen
	# Cosntants
	class Generator
		# Constants
		LANGUAGES = ["swift", "objc"]
		REPLACEMENT_KEY = "VIPER"
		AUTHOR_REPLACEMENT_KEY = "AUTHOR"
		YEAR_REPLACEMENT_KEY = "YEAR"
		DATE_REPLACEMENT_KEY = "DATE"
		PROJECT_REPLACEMENT_KEY = "PROJECT"
		COMPANY_REPLACEMENT_KEY = "COMPANY"
        SWIFT_MODULE_REPLACEMENT_KEY = "SWIFT_MODULE"

		# Main method that generate the VIPER files structure
		def self.generate_viper(template, language, name, path, author, project, company, swift_module)
			puts "Generating VIPER-Module"
			puts "Template: #{template}"
			puts "Language: #{language}"
			puts "Name: #{name}"
			puts "Path: #{path}"
			puts "Author: #{author}"
			puts "Project: #{project}"
			puts "Company: #{company}"
            puts "Module: #{swift_module}"
			path_from = Vipergen::FileManager.path_from(template, language)
			path_to = Vipergen::FileManager.destination_viper_path(path, name)
			Vipergen::FileManager.copy(path_from, path_to)
			files = Vipergen::FileManager.files_in_path(path_to)
			rename_files(files, name, author, project, company, swift_module)
		end

		# Rename all the files in the files array
		# - It renames the name of the file 
		# - It renames the content of the file
		def self.rename_files(files, name, author, project, company, swift_module)
			files.each do |file|
				raise SyntaxError unless file.include? (Vipergen::Generator::REPLACEMENT_KEY)
				rename_file(file, name, author, project, company, swift_module)
			end
		end

		# Rename a given file
		# - It renames the name of the file
		# - It renames the content of the file
		def self.rename_file(file, name, author, project, company, swift_module)
			new_path = file.gsub((Vipergen::Generator::REPLACEMENT_KEY), name)
			Vipergen::FileManager.move(file, new_path)
			rename_file_content(new_path, name, author, project, company, swift_module)
		end

		# Rename the file content
		# @return: An String with the every VIPER replaced by 'name'
		def self.rename_file_content(filename, name, author, project, company, swift_module)
			# Reading content
			file = File.open(filename, "rb")
			content = file.read
			file.close

			# Replacing content
			content = content.gsub((Vipergen::Generator::REPLACEMENT_KEY), name)
			content = content.gsub((Vipergen::Generator::AUTHOR_REPLACEMENT_KEY), author)
			content = content.gsub((Vipergen::Generator::PROJECT_REPLACEMENT_KEY), project)
			content = content.gsub((Vipergen::Generator::COMPANY_REPLACEMENT_KEY), company)
            content = content.gsub((Vipergen::Generator::SWIFT_MODULE_REPLACEMENT_KEY), swift_module)
			content = content.gsub((Vipergen::Generator::YEAR_REPLACEMENT_KEY), "#{Time.new.year}")
			content = content.gsub((Vipergen::Generator::DATE_REPLACEMENT_KEY), "#{Time.now.strftime("%d/%m/%y")}")

			# Saving content with replaced string
			File.open(filename, "w+") do |file|
   				file.write(content)
			end
		end
	end
end