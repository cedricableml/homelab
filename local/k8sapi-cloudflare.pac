function FindProxyForURL(url, host) {
    PROXY = "SOCKS5 localhost:1234"
    if (shExpMatch(host,"10.250.14.200")) {
        return PROXY;
    }
    return "DIRECT";
}
