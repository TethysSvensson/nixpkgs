{ lib
, bleak
, buildPythonPackage
, fetchFromGitHub
, pytest-mock
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "fjaraskupan";
  version = "2.0.1";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "elupus";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-i7816KJraHkrXKYA+vhKMs5xhXksnYc2uYiE0pPEicw=";
  };

  propagatedBuildInputs = [
    bleak
  ];

  checkInputs = [
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "fjaraskupan"
  ];

  meta = with lib; {
    description = "Module for controlling Fjäråskupan kitchen fans";
    homepage = "https://github.com/elupus/fjaraskupan";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
