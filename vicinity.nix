{ pkgs, src }:
pkgs.python313Packages.buildPythonPackage {
  pname = "vicinity";
  version = "0.4.4";
  pyproject = true;

  inherit src;

  build-system = with pkgs.python313Packages; [
    setuptools
    setuptools-scm
  ];

  dependencies = with pkgs.python313Packages; [
    numpy
    orjson
    tqdm
  ];

  pythonImportsCheck = [ "vicinity" ];

  meta = with pkgs.lib; {
    description = "Lightweight vector store with flexible backends";
    homepage = "https://github.com/MinishLab/vicinity";
    license = licenses.mit;
  };
}
