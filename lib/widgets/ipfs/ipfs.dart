class Ipfs {
  /// Check if the given CID is a valid representation.
  static bool isValidCID(String cid) {
    if (cid.startsWith('Qm') && cid.length == 46) {
      return true;
    }

    // TODO multibase v1

    return true;
  }

  /// Extract the CID of a given url.
  static String extractCID(String url) {
    final index = url.indexOf('ipfs/');
    if (index > -1) {
      final x = url.split('ipfs/');
      return x[1];
    }

    final cid = url.substring(url.lastIndexOf('/') + 1);

    // TODO ARC 3
    return cid;
  }

  /// Create a new url gateway to a IPFS CID.
  static String gateway(
    String cid, [
    IpfsGateway gateway = IpfsGateway.infura,
  ]) {
    return gateway.url(cid);
  }
}

enum IpfsGateway {
  infura,
  fleek,
}

final ipfsGatewayEnumMap = {
  IpfsGateway.infura: IpfsGateway.infura.id,
  IpfsGateway.fleek: IpfsGateway.fleek.id,
};

extension GatewayExt on IpfsGateway {
  int get id {
    switch (this) {
      case IpfsGateway.infura:
        return 1;
      case IpfsGateway.fleek:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case IpfsGateway.infura:
        return 'Infura';
      case IpfsGateway.fleek:
        return 'Fleek';
    }
  }

  String url(String cid) {
    switch (this) {
      case IpfsGateway.infura:
        return 'https://infura-ipfs.io/ipfs/$cid';
      case IpfsGateway.fleek:
        return 'https://ipfs.fleek.co/ipfs/$cid';
    }
  }
}
