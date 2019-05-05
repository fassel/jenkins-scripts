package filestore;

use nginx;
use Data::UUID;
use JSON::XS;
use File::Copy;

my $rootDir = "/mnt/data/store";

sub handler {
        my $r = shift;

        if ($r->request_method ne "POST") {
                return DECLINED;
        }
        if ($r->has_request_body(\&post)) {
                return OK;
        }
}

sub postResponse {
        my $r = shift;
        my $code = shift;
        my $message = shift;
        my @result = ();
        $message = "" if (!$message);
        while (my $m = shift) {
                push @result,$m;
        }
        my $obj = {"errorCode"=>$code,"errorMessage"=>$message,"result"=>@result?\@result:[]};
        my $resp = JSON::XS->new->utf8->encode($obj);
        $r->print($resp);
        return;
}

sub post {
        my $r = shift;
        my $uuid = Data::UUID->new()->create_str();
        $r->send_http_header;
        if (! -d $rootDir ) {
                mkdir $rootDir;
        }

        if ( -f $rootDir.'/'.$uuid ) {
                filestore::postResponse $r,500,"name conflict";
                return OK;
        }

        if ($r->request_body) {
                filestore::postResponse $r,1001,"internal config error";
                return OK;
        } else {
                copy ($r->request_body_file,$rootDir.'/'.$uuid);
        }
        filestore::postResponse $r,0,"ok",{"uuid"=>$uuid},{"pass"=>0};
        return OK;
}

1;