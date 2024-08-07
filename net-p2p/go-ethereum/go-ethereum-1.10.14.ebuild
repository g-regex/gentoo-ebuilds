# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Official golang implementation of the Ethereum protocol"
HOMEPAGE="https://github.com/ethereum/go-ethereum"

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0/go.mod"
	"cloud.google.com/go v0.43.0/go.mod"
	"cloud.google.com/go v0.44.1/go.mod"
	"cloud.google.com/go v0.44.2/go.mod"
	"cloud.google.com/go v0.45.1/go.mod"
	"cloud.google.com/go v0.46.3/go.mod"
	"cloud.google.com/go v0.50.0/go.mod"
	"cloud.google.com/go v0.51.0/go.mod"
	"cloud.google.com/go/bigquery v1.0.1/go.mod"
	"cloud.google.com/go/bigquery v1.3.0/go.mod"
	"cloud.google.com/go/bigtable v1.2.0/go.mod"
	"cloud.google.com/go/datastore v1.0.0/go.mod"
	"cloud.google.com/go/pubsub v1.0.1/go.mod"
	"cloud.google.com/go/pubsub v1.1.0/go.mod"
	"cloud.google.com/go/storage v1.0.0/go.mod"
	"cloud.google.com/go/storage v1.5.0/go.mod"
	"collectd.org v0.3.0/go.mod"
	"dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9/go.mod"
	"github.com/Azure/azure-pipeline-go v0.2.1/go.mod"
	"github.com/Azure/azure-pipeline-go v0.2.2"
	"github.com/Azure/azure-pipeline-go v0.2.2/go.mod"
	"github.com/Azure/azure-storage-blob-go v0.7.0"
	"github.com/Azure/azure-storage-blob-go v0.7.0/go.mod"
	"github.com/Azure/go-autorest/autorest v0.9.0"
	"github.com/Azure/go-autorest/autorest v0.9.0/go.mod"
	"github.com/Azure/go-autorest/autorest/adal v0.5.0/go.mod"
	"github.com/Azure/go-autorest/autorest/adal v0.8.0"
	"github.com/Azure/go-autorest/autorest/adal v0.8.0/go.mod"
	"github.com/Azure/go-autorest/autorest/date v0.1.0/go.mod"
	"github.com/Azure/go-autorest/autorest/date v0.2.0"
	"github.com/Azure/go-autorest/autorest/date v0.2.0/go.mod"
	"github.com/Azure/go-autorest/autorest/mocks v0.1.0/go.mod"
	"github.com/Azure/go-autorest/autorest/mocks v0.2.0/go.mod"
	"github.com/Azure/go-autorest/autorest/mocks v0.3.0"
	"github.com/Azure/go-autorest/autorest/mocks v0.3.0/go.mod"
	"github.com/Azure/go-autorest/logger v0.1.0"
	"github.com/Azure/go-autorest/logger v0.1.0/go.mod"
	"github.com/Azure/go-autorest/tracing v0.5.0"
	"github.com/Azure/go-autorest/tracing v0.5.0/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
	"github.com/DATA-DOG/go-sqlmock v1.3.3/go.mod"
	"github.com/OneOfOne/xxhash v1.2.2/go.mod"
	"github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6"
	"github.com/StackExchange/wmi v0.0.0-20180116203802-5d049714c4a6/go.mod"
	"github.com/VictoriaMetrics/fastcache v1.6.0"
	"github.com/VictoriaMetrics/fastcache v1.6.0/go.mod"
	"github.com/aead/siphash v1.0.1/go.mod"
	"github.com/ajstarks/svgo v0.0.0-20180226025133-644b8db467af/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/allegro/bigcache v1.2.1-0.20190218064605-e24eb225f156"
	"github.com/allegro/bigcache v1.2.1-0.20190218064605-e24eb225f156/go.mod"
	"github.com/andreyvit/diff v0.0.0-20170406064948-c7f18ee00883/go.mod"
	"github.com/apache/arrow/go/arrow v0.0.0-20191024131854-af6fa24be0db/go.mod"
	"github.com/aws/aws-sdk-go-v2 v1.2.0"
	"github.com/aws/aws-sdk-go-v2 v1.2.0/go.mod"
	"github.com/aws/aws-sdk-go-v2/config v1.1.1"
	"github.com/aws/aws-sdk-go-v2/config v1.1.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/credentials v1.1.1"
	"github.com/aws/aws-sdk-go-v2/credentials v1.1.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.0.2"
	"github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.0.2/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.0.2"
	"github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.0.2/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/route53 v1.1.1"
	"github.com/aws/aws-sdk-go-v2/service/route53 v1.1.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/sso v1.1.1"
	"github.com/aws/aws-sdk-go-v2/service/sso v1.1.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/sts v1.1.1"
	"github.com/aws/aws-sdk-go-v2/service/sts v1.1.1/go.mod"
	"github.com/aws/smithy-go v1.1.0"
	"github.com/aws/smithy-go v1.1.0/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/bmizerany/pat v0.0.0-20170815010413-6226ea591a40/go.mod"
	"github.com/boltdb/bolt v1.3.1/go.mod"
	"github.com/btcsuite/btcd v0.20.1-beta"
	"github.com/btcsuite/btcd v0.20.1-beta/go.mod"
	"github.com/btcsuite/btclog v0.0.0-20170628155309-84c8d2346e9f/go.mod"
	"github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d/go.mod"
	"github.com/btcsuite/go-socks v0.0.0-20170105172521-4720035b7bfd/go.mod"
	"github.com/btcsuite/goleveldb v0.0.0-20160330041536-7834afc9e8cd/go.mod"
	"github.com/btcsuite/snappy-go v0.0.0-20151229074030-0bdef8d06723/go.mod"
	"github.com/btcsuite/websocket v0.0.0-20150119174127-31079b680792/go.mod"
	"github.com/btcsuite/winsvc v1.0.0/go.mod"
	"github.com/c-bata/go-prompt v0.2.2/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/cespare/cp v0.1.0"
	"github.com/cespare/cp v0.1.0/go.mod"
	"github.com/cespare/xxhash v1.1.0"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.1"
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cloudflare/cloudflare-go v0.14.0"
	"github.com/cloudflare/cloudflare-go v0.14.0/go.mod"
	"github.com/consensys/bavard v0.1.8-0.20210406032232-f3452dc9b572/go.mod"
	"github.com/consensys/gnark-crypto v0.4.1-0.20210426202927-39ac3d4b3f1f"
	"github.com/consensys/gnark-crypto v0.4.1-0.20210426202927-39ac3d4b3f1f/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/cyberdelia/templates v0.0.0-20141128023046-ca7fffd4298c/go.mod"
	"github.com/dave/jennifer v1.2.0/go.mod"
	"github.com/davecgh/go-spew v0.0.0-20171005155431-ecdeabc65495/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/deckarep/golang-set v0.0.0-20180603214616-504e848d77ea"
	"github.com/deckarep/golang-set v0.0.0-20180603214616-504e848d77ea/go.mod"
	"github.com/deepmap/oapi-codegen v1.6.0/go.mod"
	"github.com/deepmap/oapi-codegen v1.8.2"
	"github.com/deepmap/oapi-codegen v1.8.2/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-bitstream v0.0.0-20180413035011-3522498ce2c8/go.mod"
	"github.com/dgryski/go-sip13 v0.0.0-20181026042036-e10d5fee7954/go.mod"
	"github.com/dlclark/regexp2 v1.4.1-0.20201116162257-a2a8dda75c91"
	"github.com/dlclark/regexp2 v1.4.1-0.20201116162257-a2a8dda75c91/go.mod"
	"github.com/docker/docker v1.4.2-0.20180625184442-8e610b2b55bf"
	"github.com/docker/docker v1.4.2-0.20180625184442-8e610b2b55bf/go.mod"
	"github.com/dop251/goja v0.0.0-20211011172007-d99e4b8cbf48"
	"github.com/dop251/goja v0.0.0-20211011172007-d99e4b8cbf48/go.mod"
	"github.com/dop251/goja_nodejs v0.0.0-20210225215109-d91c329300e7/go.mod"
	"github.com/eclipse/paho.mqtt.golang v1.2.0/go.mod"
	"github.com/edsrzf/mmap-go v1.0.0"
	"github.com/edsrzf/mmap-go v1.0.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/fatih/color v1.7.0"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/fjl/memsize v0.0.0-20190710130421-bcb5799ab5e5"
	"github.com/fjl/memsize v0.0.0-20190710130421-bcb5799ab5e5/go.mod"
	"github.com/fogleman/gg v1.2.1-0.20190220221249-0403632d5b90/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fsnotify/fsnotify v1.4.9"
	"github.com/fsnotify/fsnotify v1.4.9/go.mod"
	"github.com/gballet/go-libpcsclite v0.0.0-20190607065134-2772fd86a8ff"
	"github.com/gballet/go-libpcsclite v0.0.0-20190607065134-2772fd86a8ff/go.mod"
	"github.com/getkin/kin-openapi v0.53.0/go.mod"
	"github.com/getkin/kin-openapi v0.61.0/go.mod"
	"github.com/ghodss/yaml v1.0.0/go.mod"
	"github.com/glycerine/go-unsnap-stream v0.0.0-20180323001048-9f0cb55181dd/go.mod"
	"github.com/glycerine/goconvey v0.0.0-20190410193231-58a59202ab31/go.mod"
	"github.com/go-chi/chi/v5 v5.0.0/go.mod"
	"github.com/go-gl/glfw v0.0.0-20190409004039-e6da0acd62b1/go.mod"
	"github.com/go-gl/glfw/v3.3/glfw v0.0.0-20191125211704-12ad95a8df72/go.mod"
	"github.com/go-kit/kit v0.8.0"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-logfmt/logfmt v0.4.0"
	"github.com/go-logfmt/logfmt v0.4.0/go.mod"
	"github.com/go-ole/go-ole v1.2.1"
	"github.com/go-ole/go-ole v1.2.1/go.mod"
	"github.com/go-openapi/jsonpointer v0.19.5/go.mod"
	"github.com/go-openapi/swag v0.19.5/go.mod"
	"github.com/go-sourcemap/sourcemap v2.1.3+incompatible"
	"github.com/go-sourcemap/sourcemap v2.1.3+incompatible/go.mod"
	"github.com/go-sql-driver/mysql v1.4.1/go.mod"
	"github.com/go-stack/stack v1.8.0"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gofrs/uuid v3.3.0+incompatible/go.mod"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/gogo/protobuf v1.3.1/go.mod"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0/go.mod"
	"github.com/golang/geo v0.0.0-20190916061304-5b978397cfec/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6/go.mod"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/mock v1.3.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.4.3"
	"github.com/golang/protobuf v1.4.3/go.mod"
	"github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db/go.mod"
	"github.com/golang/snappy v0.0.3/go.mod"
	"github.com/golang/snappy v0.0.4"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/golangci/lint-1 v0.0.0-20181222135242-d2cdd8c08219/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/flatbuffers v1.11.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.4.1/go.mod"
	"github.com/google/go-cmp v0.5.4"
	"github.com/google/go-cmp v0.5.4/go.mod"
	"github.com/google/gofuzz v1.1.1-0.20200604201612-c04b05f3adfa"
	"github.com/google/gofuzz v1.1.1-0.20200604201612-c04b05f3adfa/go.mod"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/pprof v0.0.0-20190515194954-54271f7e092f/go.mod"
	"github.com/google/pprof v0.0.0-20191218002539-d4f498aebedc/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.1.5"
	"github.com/google/uuid v1.1.5/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/mux v1.8.0/go.mod"
	"github.com/gorilla/websocket v1.4.2"
	"github.com/gorilla/websocket v1.4.2/go.mod"
	"github.com/graph-gophers/graphql-go v0.0.0-20201113091052-beb923fada29"
	"github.com/graph-gophers/graphql-go v0.0.0-20201113091052-beb923fada29/go.mod"
	"github.com/hashicorp/go-bexpr v0.1.10"
	"github.com/hashicorp/go-bexpr v0.1.10/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.5-0.20210104140557-80c98217689d"
	"github.com/hashicorp/golang-lru v0.5.5-0.20210104140557-80c98217689d/go.mod"
	"github.com/holiman/bloomfilter/v2 v2.0.3"
	"github.com/holiman/bloomfilter/v2 v2.0.3/go.mod"
	"github.com/holiman/uint256 v1.2.0"
	"github.com/holiman/uint256 v1.2.0/go.mod"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/huin/goupnp v1.0.2"
	"github.com/huin/goupnp v1.0.2/go.mod"
	"github.com/huin/goutil v0.0.0-20170803182201-1ca381bf3150/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20181102032728-5e5cf60278f6/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/influxdata/flux v0.65.1/go.mod"
	"github.com/influxdata/influxdb v1.8.3"
	"github.com/influxdata/influxdb v1.8.3/go.mod"
	"github.com/influxdata/influxdb-client-go/v2 v2.4.0"
	"github.com/influxdata/influxdb-client-go/v2 v2.4.0/go.mod"
	"github.com/influxdata/influxql v1.1.1-0.20200828144457-65d3ef77d385/go.mod"
	"github.com/influxdata/line-protocol v0.0.0-20180522152040-32c6aa80de5e/go.mod"
	"github.com/influxdata/line-protocol v0.0.0-20200327222509-2487e7298839/go.mod"
	"github.com/influxdata/line-protocol v0.0.0-20210311194329-9aa0e372d097"
	"github.com/influxdata/line-protocol v0.0.0-20210311194329-9aa0e372d097/go.mod"
	"github.com/influxdata/promql/v2 v2.12.0/go.mod"
	"github.com/influxdata/roaring v0.4.13-0.20180809181101-fc520f41fab6/go.mod"
	"github.com/influxdata/tdigest v0.0.0-20181121200506-bf2b5ad3c0a9/go.mod"
	"github.com/influxdata/usage-client v0.0.0-20160829180054-6d3895376368/go.mod"
	"github.com/jackpal/go-nat-pmp v1.0.2-0.20160603034137-1fa385a6f458"
	"github.com/jackpal/go-nat-pmp v1.0.2-0.20160603034137-1fa385a6f458/go.mod"
	"github.com/jedisct1/go-minisign v0.0.0-20190909160543-45766022959e"
	"github.com/jedisct1/go-minisign v0.0.0-20190909160543-45766022959e/go.mod"
	"github.com/jessevdk/go-flags v0.0.0-20141203071132-1679536dcc89/go.mod"
	"github.com/jmespath/go-jmespath v0.4.0/go.mod"
	"github.com/jmespath/go-jmespath/internal/testify v1.5.1/go.mod"
	"github.com/jrick/logrotate v1.0.0/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jstemmer/go-junit-report v0.9.1/go.mod"
	"github.com/jsternberg/zap-logfmt v1.0.0/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/jung-kurt/gofpdf v1.0.3-0.20190309125859-24315acbbda5/go.mod"
	"github.com/jwilder/encoding v0.0.0-20170811194829-b4e1701a28ef/go.mod"
	"github.com/karalabe/usb v0.0.0-20211005121534-4c5740d64559"
	"github.com/karalabe/usb v0.0.0-20211005121534-4c5740d64559/go.mod"
	"github.com/kisielk/errcheck v1.2.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/kkdai/bstream v0.0.0-20161212061736-f391b8402d23/go.mod"
	"github.com/klauspost/compress v1.4.0/go.mod"
	"github.com/klauspost/cpuid v0.0.0-20170728055534-ae7887de9fa5/go.mod"
	"github.com/klauspost/crc32 v0.0.0-20161016154125-cb6bfca970f6/go.mod"
	"github.com/klauspost/pgzip v1.0.2-0.20170402124221-0bf5dcad4ada/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.1"
	"github.com/kr/pretty v0.2.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/kylelemons/godebug v1.1.0/go.mod"
	"github.com/labstack/echo/v4 v4.2.1/go.mod"
	"github.com/labstack/gommon v0.3.0/go.mod"
	"github.com/leanovate/gopter v0.2.9"
	"github.com/leanovate/gopter v0.2.9/go.mod"
	"github.com/lib/pq v1.0.0/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190614124828-94de47d64c63/go.mod"
	"github.com/mailru/easyjson v0.0.0-20190626092158-b2ccc519800e/go.mod"
	"github.com/matryer/moq v0.0.0-20190312154309-6cfb0558e1bd/go.mod"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.7/go.mod"
	"github.com/mattn/go-colorable v0.1.8"
	"github.com/mattn/go-colorable v0.1.8/go.mod"
	"github.com/mattn/go-ieproxy v0.0.0-20190610004146-91bb50d98149/go.mod"
	"github.com/mattn/go-ieproxy v0.0.0-20190702010315-6dee0af9227d"
	"github.com/mattn/go-ieproxy v0.0.0-20190702010315-6dee0af9227d/go.mod"
	"github.com/mattn/go-isatty v0.0.4/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-runewidth v0.0.3/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/mattn/go-sqlite3 v1.11.0/go.mod"
	"github.com/mattn/go-tty v0.0.0-20180907095812-13ff1204f104/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mitchellh/mapstructure v1.4.1"
	"github.com/mitchellh/mapstructure v1.4.1/go.mod"
	"github.com/mitchellh/pointerstructure v1.2.0"
	"github.com/mitchellh/pointerstructure v1.2.0/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/mschoch/smat v0.0.0-20160514031455-90eadee771ae/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/naoina/go-stringutil v0.1.0"
	"github.com/naoina/go-stringutil v0.1.0/go.mod"
	"github.com/naoina/toml v0.1.2-0.20170918210437-9fafd6967416"
	"github.com/naoina/toml v0.1.2-0.20170918210437-9fafd6967416/go.mod"
	"github.com/nxadm/tail v1.4.4"
	"github.com/nxadm/tail v1.4.4/go.mod"
	"github.com/oklog/ulid v1.3.1/go.mod"
	"github.com/olekukonko/tablewriter v0.0.5"
	"github.com/olekukonko/tablewriter v0.0.5/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.7.0/go.mod"
	"github.com/onsi/ginkgo v1.12.1/go.mod"
	"github.com/onsi/ginkgo v1.14.0"
	"github.com/onsi/ginkgo v1.14.0/go.mod"
	"github.com/onsi/gomega v1.4.3/go.mod"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/onsi/gomega v1.10.1"
	"github.com/onsi/gomega v1.10.1/go.mod"
	"github.com/opentracing/opentracing-go v1.0.2/go.mod"
	"github.com/opentracing/opentracing-go v1.0.3-0.20180606204148-bd9c31933947/go.mod"
	"github.com/opentracing/opentracing-go v1.1.0"
	"github.com/opentracing/opentracing-go v1.1.0/go.mod"
	"github.com/paulbellamy/ratecounter v0.2.0/go.mod"
	"github.com/peterh/liner v1.0.1-0.20180619022028-8c1271fcf47f/go.mod"
	"github.com/peterh/liner v1.1.1-0.20190123174540-a2c9a5303de7"
	"github.com/peterh/liner v1.1.1-0.20190123174540-a2c9a5303de7/go.mod"
	"github.com/philhofer/fwd v1.0.0/go.mod"
	"github.com/pierrec/lz4 v2.0.5+incompatible/go.mod"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pkg/term v0.0.0-20180730021639-bffc007b7fd5/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v1.0.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/common v0.0.0-20181113130724-41aa239b4cce/go.mod"
	"github.com/prometheus/common v0.4.1/go.mod"
	"github.com/prometheus/common v0.6.0/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.2/go.mod"
	"github.com/prometheus/tsdb v0.7.1"
	"github.com/prometheus/tsdb v0.7.1/go.mod"
	"github.com/retailnext/hllpp v1.0.1-0.20180308014038-101a6d2f8b52/go.mod"
	"github.com/rjeczalik/notify v0.9.1"
	"github.com/rjeczalik/notify v0.9.1/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/rs/cors v1.7.0"
	"github.com/rs/cors v1.7.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
	"github.com/segmentio/kafka-go v0.1.0/go.mod"
	"github.com/segmentio/kafka-go v0.2.0/go.mod"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shirou/gopsutil v3.21.4-0.20210419000835-c7a38de76ee5+incompatible"
	"github.com/shirou/gopsutil v3.21.4-0.20210419000835-c7a38de76ee5+incompatible/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.3/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/status-im/keycard-go v0.0.0-20190316090335-8537d3370df4"
	"github.com/status-im/keycard-go v0.0.0-20190316090335-8537d3370df4/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/syndtr/goleveldb v1.0.1-0.20210819022825-2ae1ddf74ef7"
	"github.com/syndtr/goleveldb v1.0.1-0.20210819022825-2ae1ddf74ef7/go.mod"
	"github.com/tinylib/msgp v1.0.2/go.mod"
	"github.com/tklauser/go-sysconf v0.3.5"
	"github.com/tklauser/go-sysconf v0.3.5/go.mod"
	"github.com/tklauser/numcpus v0.2.2"
	"github.com/tklauser/numcpus v0.2.2/go.mod"
	"github.com/tyler-smith/go-bip39 v1.0.1-0.20181017060643-dbb3b84ba2ef"
	"github.com/tyler-smith/go-bip39 v1.0.1-0.20181017060643-dbb3b84ba2ef/go.mod"
	"github.com/urfave/cli/v2 v2.3.0/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasttemplate v1.0.1/go.mod"
	"github.com/valyala/fasttemplate v1.2.1/go.mod"
	"github.com/willf/bitset v1.1.3/go.mod"
	"github.com/xlab/treeprint v0.0.0-20180616005107-d6fb6747feb6/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.0/go.mod"
	"go.opencensus.io v0.22.2/go.mod"
	"go.uber.org/atomic v1.3.2/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/zap v1.9.1/go.mod"
	"golang.org/x/crypto v0.0.0-20170930174604-9419663f5a44/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20190909091759-094676da4a83/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20200820211705-5c72a883971a/go.mod"
	"golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad/go.mod"
	"golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2"
	"golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2/go.mod"
	"golang.org/x/exp v0.0.0-20180321215751-8460e604b9de/go.mod"
	"golang.org/x/exp v0.0.0-20180807140117-3d87b88a115f/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/exp v0.0.0-20190125153040-c74c464bbbf2/go.mod"
	"golang.org/x/exp v0.0.0-20190306152737-a1d7652674e8/go.mod"
	"golang.org/x/exp v0.0.0-20190510132918-efd6b22b2522/go.mod"
	"golang.org/x/exp v0.0.0-20190829153037-c13cbed26979/go.mod"
	"golang.org/x/exp v0.0.0-20191030013958-a1ab85dbe136/go.mod"
	"golang.org/x/exp v0.0.0-20191129062945-2f5052295587/go.mod"
	"golang.org/x/exp v0.0.0-20191227195350-da58074b4299/go.mod"
	"golang.org/x/image v0.0.0-20180708004352-c73c2afc3b81/go.mod"
	"golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
	"golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190909230951-414d861bb4ac/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/lint v0.0.0-20191125180803-fdd1cda4f05f/go.mod"
	"golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
	"golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.4.2/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190501004415-9ce7a6920f09/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190724013045-ca1201d0de80/go.mod"
	"golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553/go.mod"
	"golang.org/x/net v0.0.0-20200520004742-59133d7f0dd7/go.mod"
	"golang.org/x/net v0.0.0-20200813134508-3edf25e44fcc/go.mod"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20210119194325-5f4716e94777/go.mod"
	"golang.org/x/net v0.0.0-20210220033124-5f55cee0dc0d/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d"
	"golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/oauth2 v0.0.0-20191202225959-858c2ad4c8b6/go.mod"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20200317015054-43a5402ce75a/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181107165924-66b7b1311ac8/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0/go.mod"
	"golang.org/x/sys v0.0.0-20190726091711-fc99dfbffb4e/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/sys v0.0.0-20190904154756-749cb33beabd/go.mod"
	"golang.org/x/sys v0.0.0-20191005200804-aed5e4c7ecf9/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
	"golang.org/x/sys v0.0.0-20191204072324-ce4227a45e2e/go.mod"
	"golang.org/x/sys v0.0.0-20191228213918-04cbcbbfeed8/go.mod"
	"golang.org/x/sys v0.0.0-20200107162124-548cf772de50/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200519105757-fe76b779f299/go.mod"
	"golang.org/x/sys v0.0.0-20200814200057-3d37ad5750ed/go.mod"
	"golang.org/x/sys v0.0.0-20200826173525-f9321e4c35a6/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210119212857-b64e53b001e4/go.mod"
	"golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c/go.mod"
	"golang.org/x/sys v0.0.0-20210316164454-77fc1eacc6aa/go.mod"
	"golang.org/x/sys v0.0.0-20210324051608-47abb6519492/go.mod"
	"golang.org/x/sys v0.0.0-20210420205809-ac73e9fd8988/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210816183151-1e6c022a8912"
	"golang.org/x/sys v0.0.0-20210816183151-1e6c022a8912/go.mod"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.4/go.mod"
	"golang.org/x/text v0.3.5/go.mod"
	"golang.org/x/text v0.3.6"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/time v0.0.0-20201208040808-7e3f01d25324/go.mod"
	"golang.org/x/time v0.0.0-20210220033141-f8bda1e9f3ba"
	"golang.org/x/time v0.0.0-20210220033141-f8bda1e9f3ba/go.mod"
	"golang.org/x/tools v0.0.0-20180525024113-a5b4c53f6e8b/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20181030221726-6c7e314b6563/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190206041539-40960b6deb8e/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190425150028-36563e24a262/go.mod"
	"golang.org/x/tools v0.0.0-20190506145303-2d16b83fe98c/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190628153133-6cdbf07be9d0/go.mod"
	"golang.org/x/tools v0.0.0-20190816200558-6889da9d5479/go.mod"
	"golang.org/x/tools v0.0.0-20190911174233-4f2ddba30aff/go.mod"
	"golang.org/x/tools v0.0.0-20191012152004-8de300cfc20a/go.mod"
	"golang.org/x/tools v0.0.0-20191113191852-77e3bb0ad9e7/go.mod"
	"golang.org/x/tools v0.0.0-20191115202509-3a792d9c32b2/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191125144606-a911d9008d1f/go.mod"
	"golang.org/x/tools v0.0.0-20191216173652-a0e659d51361/go.mod"
	"golang.org/x/tools v0.0.0-20191227053925-7b8e75db28f4/go.mod"
	"golang.org/x/tools v0.0.0-20200108203644-89082a384178/go.mod"
	"golang.org/x/tools v0.1.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"gonum.org/v1/gonum v0.0.0-20180816165407-929014505bf4/go.mod"
	"gonum.org/v1/gonum v0.0.0-20181121035319-3f7ecaa7e8ca/go.mod"
	"gonum.org/v1/gonum v0.6.0/go.mod"
	"gonum.org/v1/netlib v0.0.0-20181029234149-ec6d1f5cefe6/go.mod"
	"gonum.org/v1/netlib v0.0.0-20190313105609-8cb42192e0e0/go.mod"
	"gonum.org/v1/plot v0.0.0-20190515093506-e2840ee46a6b/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.7.0/go.mod"
	"google.golang.org/api v0.8.0/go.mod"
	"google.golang.org/api v0.9.0/go.mod"
	"google.golang.org/api v0.13.0/go.mod"
	"google.golang.org/api v0.14.0/go.mod"
	"google.golang.org/api v0.15.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.1/go.mod"
	"google.golang.org/appengine v1.6.5/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873/go.mod"
	"google.golang.org/genproto v0.0.0-20190716160619-c506a9f90610/go.mod"
	"google.golang.org/genproto v0.0.0-20190801165951-fa694d86fc64/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20190911173649-1774047e7e51/go.mod"
	"google.golang.org/genproto v0.0.0-20191108220845-16a3f7862a1a/go.mod"
	"google.golang.org/genproto v0.0.0-20191115194625-c23dd37a84c9/go.mod"
	"google.golang.org/genproto v0.0.0-20191216164720-4f79533eabd1/go.mod"
	"google.golang.org/genproto v0.0.0-20191230161307-f3c370f40bfb/go.mod"
	"google.golang.org/genproto v0.0.0-20200108215221-bd8f9a0ef82f/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.1/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.26.0/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.23.0"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/natefinch/npipe.v2 v2.0.0-20160621034901-c1b8fa8bdcce"
	"gopkg.in/natefinch/npipe.v2 v2.0.0-20160621034901-c1b8fa8bdcce/go.mod"
	"gopkg.in/olebedev/go-duktape.v3 v3.0.0-20200619000410-60c24ae608a6"
	"gopkg.in/olebedev/go-duktape.v3 v3.0.0-20200619000410-60c24ae608a6/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/urfave/cli.v1 v1.20.0"
	"gopkg.in/urfave/cli.v1 v1.20.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.3/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gotest.tools v2.2.0+incompatible"
	"gotest.tools v2.2.0+incompatible/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190418001031-e561f6794a2a/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"honnef.co/go/tools v0.1.3/go.mod"
	"rsc.io/binaryregexp v0.2.0/go.mod"
	"rsc.io/pdf v0.1.1/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/ethereum/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="devtools"

# Does all kinds of wonky stuff like connecting to Docker daemon, network activity, ...
RESTRICT+=" test"

src_compile() {
	emake $(usex devtools all geth)
}

src_install() {
	einstalldocs

	dobin build/bin/geth

	if use devtools; then
		dobin build/bin/abidump
		dobin build/bin/abigen
		dobin build/bin/bootnode
		dobin build/bin/checkpoint-admin
		dobin build/bin/clef
		dobin build/bin/devp2p
		dobin build/bin/ethkey
		dobin build/bin/evm
		dobin build/bin/faucet
		dobin build/bin/p2psim
		dobin build/bin/puppeth
		dobin build/bin/rlpdump
	fi
}
