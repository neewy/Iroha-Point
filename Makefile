UNAME := $(shell uname)

clone:
	mkdir iroha-schema
	git -C iroha-schema init
	git -C iroha-schema remote add -f schema https://github.com/hyperledger/iroha.git
	git -C iroha-schema config core.sparseCheckout true
	echo "schema" >> iroha-schema/.git/info/sparse-checkout
	git -C iroha-schema pull schema master
	mkdir IrohaPoint/proto

clean:
	rm -rf iroha-schema
	rm -rf IrohaPoint/proto/*

.PHONY: clone clean