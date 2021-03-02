### 服务端

deploy with [heroku button](https://heroku.com/deploy)

点击上面紫色`Deploy to Heroku`，会跳转到 heroku app 创建页面，填上应用的名称、选择节点(建议用欧洲节点，美国节点会自动删除 YouTube 评论与点赞！)、按需修改部分参数和 UUID 后点击下面`deploy`开始创建部署应用
如出现错误，可以多尝试几次，待部署完成后页面底部会显示`Your app was successfully deployed`

- 点击 Manage App 可在 Settings 下的 Config Vars 项**查看和重新设置参数**
- 点击 Open app 跳转[欢迎页面](/etc/CADDYIndexPage.md)域名即为 heroku 分配域名，格式为`xxx.herokuapp.com`，用于客户端
- 默认协议密码为`24b4b1e1-7a89-45f6-858c-242cf53b5bdb`，WS 路径为$UUID-[vmess|vless|trojan|ss|socks]格式

## vless

```bash
* 客户端下载：https://github.com/2dust/v2rayN/releases
* 代理协议：vless 或 vmess
* 地址：xxx.herokuapp.com
* 端口：443
* 默认UUID：24b4b1e1-7a89-45f6-858c-242cf53b5bdb
* vmess额外id：0
* 加密：none
* 传输协议：ws
* 伪装类型：none
* 伪装域名：xxx.workers.dev(CF Workers反代地址)
* 路径：/24b4b1e1-7a89-45f6-858c-242cf53b5bdb-vless // 默认vless使用(/自定义UUID码-vless)，vmess使用(/自定义UUID码-vmess)
* 底层传输安全：tls
* 跳过证书验证：false
```

</details>

<details>
<summary>Trojan-Go</summary>

```bash
* 客户端下载: https://github.com/p4gefau1t/trojan-go/releases
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "xxx.herokuapp.com",
    "remote_port": 443,
    "password": [
        "24b4b1e1-7a89-45f6-858c-242cf53b5bdb"
    ],
    "websocket": {
        "enabled": true,
        "path": "/24b4b1e1-7a89-45f6-858c-242cf53b5bdb-trojan",
        "host": "xxx.herokuapp.com"
    }
}
```

</details>

<details>
<summary>Shadowsocks</summary>

```bash
* 客户端下载：https://github.com/shadowsocks/shadowsocks-windows/releases/
* 服务器地址: xxx.herokuapp.com
* 端口: 443
* 密码：24b4b1e1-7a89-45f6-858c-242cf53b5bdb
* 加密：chacha20-ietf-poly1305
* 插件程序：xray-plugin_windows_amd64.exe  //需将插件https://github.com/shadowsocks/xray-plugin/releases下载解压后放至shadowsocks同目录
* 插件选项: tls;host=xxx.herokuapp.com;path=/24b4b1e1-7a89-45f6-858c-242cf53b5bdb-ss
```

## cloudflare wo

```js
const SingleDay = 'xxx.herokuapp.com'
const DoubleDay = 'xxx.herokuapp.com'
addEventListener('fetch', (event) => {
	let nd = new Date()
	if (nd.getDate() % 2) {
		host = SingleDay
	} else {
		host = DoubleDay
	}

	let url = new URL(event.request.url)
	url.hostname = host
	let request = new Request(url, event.request)
	event.respondWith(fetch(request))
})
```

## 关于 CF 筛选 IP

- 请参考 [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest) `推荐`
- 请参考 [better-cloudflare-ip](https://github.com/badafans/better-cloudflare-ip)

### reference

- [mixool](https://github.com/mixool/)
- [bclswl0827](https://github.com/bclswl0827/v2ray-heroku)
- [yxhit](https://github.com/yxhit)
- [badafans](https://github.com/badafans/better-cloudflare-ip/tree/20201208)
