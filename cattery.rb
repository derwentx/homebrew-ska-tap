class Cattery < Formula
  desc 'MeqTrees-based frameworks for interferometer simulation and calibration'
  homepage 'http://meqtrees.net'
  url 'https://svn.astron.nl/MeqTrees/release/Cattery/release-1.2.0'
  head 'https://github.com/ska-sa/meqtrees-cattery.git'

  def install
    # Obtain information on Python installation
    python_xy = "python" + %x(python -c 'import sys;print(sys.version[:3])').chomp
    python_site_packages = lib + "#{python_xy}/site-packages"
    mkdir_p "#{python_site_packages}"
    rm_f 'Meow/LSM0'
    cp_r 'LSM', 'Meow/LSM0'
    cp_r ['Calico', 'LSM', 'Lions', 'Meow', 'Siamese', 'qt.py'],
         "#{python_site_packages}/"
    if build.head?
      cp_r 'Scripter', "#{python_site_packages}/"
    end
    mkdir_p "#{share}/meqtrees"
    cp_r 'test', "#{share}/meqtrees/"
  end
end
