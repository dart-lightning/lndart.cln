import 'package:cln_common/cln_common.dart';
import 'package:lnlambda/lnlambda.dart';

void main() {
  var client = LNLambdaClient(
      nodeID:
          "028fe59bd7bbe3982699535e7e43b305c69099fbdd9902b1af5875a121fdb9a3dc",
      host: "52.55.124.1:19735",
      rune:
          "iuFSqODmg91rS57iKParjK0NUb7weqyksEmqruSapW89MyZtZXRob2RebGlzdHxtZXRob2ReZ2V0fG1ldGhvZD1zdW1tYXJ5Jm1ldGhvZC9nZXRzaGFyZWRzZWNyZXQmbWV0aG9kL2xpc3RkYXRhc3RvcmU=",
      lambdaServer: "http://ec2-52-55-124-1.compute-1.amazonaws.com:9002");
  var response = client.simpleCall("getinfo", params: {});
  LogManager.getInstance.debug("Response from lambda $response");
}
