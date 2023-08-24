{ lib }: let 

  inherit (builtins) readDir;
  inherit (lib) filterAttrs mapAttrsToList;

in {

  # Retrieves all the folder names from a given directory.
  getSubfolders = dirPath: let

    # Read the directory and filter out anything that is not a directory.
    dirContent = readDir dirPath;
    subfolders = filterAttrs (_: value: value == "directory") dirContent;

    # Keep the key only, as it contains the folder name.
    subfolderList = mapAttrsToList (key: _: key) subfolders;

  in subfolderList;
}