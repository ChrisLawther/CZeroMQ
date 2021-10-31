SodiumVersion=1.0.18
ZmqVersion=4.3.3

Jobs=8
OptFlags="-O3 -fembed-bitcode -fmodules"
MinIosVersion=12.0

BuildDir=_build

ZmqSrc=zeromq-${ZmqVersion}
ZmqTgz=${ZmqSrc}.tar.gz
ZmqUrl=https://github.com/zeromq/libzmq/releases/download/v${ZmqVersion}/${ZmqTgz}

SodiumSrc=libsodium-${SodiumVersion}
SodiumTgz=${SodiumSrc}.tar.gz
SodiumUrl=https://github.com/jedisct1/libsodium/archive/${SodiumVersion}.tar.gz

${BuildDir}:
	mkdir ${BuildDir}

${ZmqTgz}:
	curl -L -O ${ZmqUrl}

${ZmqSrc}: ${ZmqTgz}
	tar -zxvf ${ZmqTgz}	

${SodiumTgz}:
	curl -L -o ${SodiumTgz} ${SodiumUrl}

${SodiumSrc}: ${SodiumTgz}
	tar -zxvf ${SodiumTgz}

build: ${SodiumSrc} ${ZmqSrc}
	echo "Would build in $(pwd)"

srcs: ${BuildDir}
	cd ${BuildDir} && make -f ../Makefile build

