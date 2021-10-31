SodiumVersion=1.0.18
ZmqVersion=4.3.3

Jobs=8
OptFlags="-O3 -fembed-bitcode -fmodules"
MinIosVersion=12.0

ZmqSrc=zeromq-${ZmqVersion}
ZmqTgz=${ZmqSrc}.tar.gz
ZmqUrl=https://github.com/zeromq/libzmq/releases/download/v${ZmqVersion}/${ZmqTgz}

SodiumSrc=libsodium-${SodiumVersion}
SodiumTgz=${SodiumSrc}.tar.gz
SodiumUrl=https://github.com/jedisct1/libsodium/archive/${SodiumVersion}.tar.gz

${ZmqTgz}:
	curl -L -O ${ZmqUrl}

${ZmqSrc}: ${ZmqTgz}
	tar -zxvf ${ZmqTgz}	

${SodiumTgz}:
	curl -L -o ${SodiumTgz} ${SodiumUrl}

${SodiumSrc}: ${SodiumTgz}
	tar -zxvf ${SodiumTgz}

srcs: ${SodiumSrc} ${ZmqSrc}
	echo "TOOD: Actually build stuff"

framework: srcs
	xcodebuild \
		-create-xcframework \
		-library _build/zeromq-4.3.3/_build/platforms/simulator/lib/libzmq.a \
		-headers universal/include \
		-library _build/zeromq-4.3.3/_build/platforms/device/lib/libzmq.a \
		-headers universal/include \
		-output ../libzmq.xcframework
