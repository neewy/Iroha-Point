#!/bin/bash

UNAME=$(uname)

if [ $UNAME == 'Darwin' ]
then
    for f in iroha-schema/schema/*.proto; do
        echo $f
        ./packages/Grpc.Tools.1.8.3/tools/macosx_x64/protoc \
        --proto_path=/Users/$USER/.nuget/packages/google.protobuf.tools/3.5.1/tools/ \
		--proto_path=iroha-schema/schema \
		--csharp_out=IrohaPoint/proto \
		--grpc_out=IrohaPoint/proto \
        --csharp_opt=file_extension=.g.cs \
		--plugin=protoc-gen-grpc=./packages/Grpc.Tools.1.8.3/tools/macosx_x64/grpc_csharp_plugin \
        $f
    done
fi
