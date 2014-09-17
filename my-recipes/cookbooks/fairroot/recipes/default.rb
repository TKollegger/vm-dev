# variables
dev_packages = ["gcc", "gcc-gfortran", "gcc-c++", "make", "cmake", "flex", "bison", "unzip", "bzip2", "subversion", "git", "patch", "libX11-devel", "libXmu-devel", "libXpm-devel", "libXft-devel", "libXext-devel", "mesa-libGL-devel", "mesa-libGLU-devel", "ncurses-devel", "expat-devel" ]

# install necessary packages
dev_packages.each do|p|
  package p do
    action :install
  end
end
