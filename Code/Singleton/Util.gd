extends Node

func loadTexture(path, exclude_extension = []):
	var arrayTexture:Array
	var cDir:Directory = Directory.new()
	cDir.open(path)
	cDir.list_dir_begin()
	
	var file_name = cDir.get_next()
	while file_name != "":
		if file_name.ends_with(".import") and !exclude_extension.has(file_name.get_basename().get_extension()):#and file_name != "." and file_name != "..":
			arrayTexture.append(ResourceLoader.load(path + file_name.get_basename()))
		file_name = cDir.get_next()
		
	cDir.list_dir_end()
	return arrayTexture
	

func listTexture(path, exclude_extension = []):
	var arrayTexture:Array
	var cDir:Directory = Directory.new()
	cDir.open(path)
	cDir.list_dir_begin()
	
	var file_name = cDir.get_next()
	while file_name != "":
		if file_name.ends_with(".import") and !exclude_extension.has(file_name.get_basename().get_extension()):#and file_name != "." and file_name != "..":
			arrayTexture.append(path + file_name.get_basename())
		file_name = cDir.get_next()
		
	cDir.list_dir_end()
	return arrayTexture
