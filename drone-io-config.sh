echo "Install avr-gcc..."
wget --quiet  http://downloads.arduino.cc/arduino-1.5.7-linux32.tgz
tar -xf arduino-1.5.7-linux32.tgz
sudo mv arduino-1.5.7/hardware/tools/avr /usr/local/share/avr-gcc

# echo "Test avr-gcc..."
# /usr/local/share/avr-gcc/bin/avr-gcc -v

echo "Install Arduino IDE..."
wget --quiet  http://arduino.googlecode.com/files/arduino-1.0.5-linux32.tgz
tar -xf arduino-1.0.5-linux32.tgz
sudo mv arduino-1.0.5/ /usr/local/share/arduino

echo "Cloning Arduino-Makefie and activate auto-lib..."
git submodule init && git submodule update
cd Arduino-Makefile
git checkout auto-lib
cd ..

echo "Test MyFirstProject..."
cd src/mySecondProject
git clone https://gist.github.com/ladislas/230f38359c3526fba944 ./tmp
cp ./tmp/Makefile ./
make

echo "Test MySecondProject..."
cd ../mySecondProject
git clone https://gist.github.com/ladislas/230f38359c3526fba944 ./tmp
cp ./tmp/Makefile ./
make


