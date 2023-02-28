<div align="center">

<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="center" width="144px" height="144px"/>

### Homelab w/ Kubernetes cluster (Talos) :sailboat: and other labby bits



</div>

<br/>

<div align="center">

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![renovate](https://img.shields.io/badge/renovate-enabled-green?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjUgNSAzNzAgMzcwIj48Y2lyY2xlIGN4PSIxODkiIGN5PSIxOTAiIHI9IjE4NCIgZmlsbD0iI2ZlMiIvPjxwYXRoIGZpbGw9IiM4YmIiIGQ9Ik0yNTEgMjU2bC0zOC0zOGExNyAxNyAwIDAxMC0yNGw1Ni01NmMyLTIgMi02IDAtN2wtMjAtMjFhNSA1IDAgMDAtNyAwbC0xMyAxMi05LTggMTMtMTNhMTcgMTcgMCAwMTI0IDBsMjEgMjFjNyA3IDcgMTcgMCAyNGwtNTYgNTdhNSA1IDAgMDAwIDdsMzggMzh6Ii8+PHBhdGggZmlsbD0iI2Q1MSIgZD0iTTMwMCAyODhsLTggOGMtNCA0LTExIDQtMTYgMGwtNDYtNDZjLTUtNS01LTEyIDAtMTZsOC04YzQtNCAxMS00IDE1IDBsNDcgNDdjNCA0IDQgMTEgMCAxNXoiLz48cGF0aCBmaWxsPSIjYjMwIiBkPSJNMjg1IDI1OGw3IDdjNCA0IDQgMTEgMCAxNWwtOCA4Yy00IDQtMTEgNC0xNiAwbC02LTdjNCA1IDExIDUgMTUgMGw4LTdjNC01IDQtMTIgMC0xNnoiLz48cGF0aCBmaWxsPSIjYTMwIiBkPSJNMjkxIDI2NGw4IDhjNCA0IDQgMTEgMCAxNmwtOCA3Yy00IDUtMTEgNS0xNSAwbC05LThjNSA1IDEyIDUgMTYgMGw4LThjNC00IDQtMTEgMC0xNXoiLz48cGF0aCBmaWxsPSIjZTYyIiBkPSJNMjYwIDIzM2wtNC00Yy02LTYtMTctNi0yMyAwLTcgNy03IDE3IDAgMjRsNCA0Yy00LTUtNC0xMSAwLTE2bDgtOGM0LTQgMTEtNCAxNSAweiIvPjxwYXRoIGZpbGw9IiNiNDAiIGQ9Ik0yODQgMzA0Yy00IDAtOC0xLTExLTRsLTQ3LTQ3Yy02LTYtNi0xNiAwLTIybDgtOGM2LTYgMTYtNiAyMiAwbDQ3IDQ2YzYgNyA2IDE3IDAgMjNsLTggOGMtMyAzLTcgNC0xMSA0em0tMzktNzZjLTEgMC0zIDAtNCAybC04IDdjLTIgMy0yIDcgMCA5bDQ3IDQ3YTYgNiAwIDAwOSAwbDctOGMzLTIgMy02IDAtOWwtNDYtNDZjLTItMi0zLTItNS0yeiIvPjxwYXRoIGZpbGw9IiMxY2MiIGQ9Ik0xNTIgMTEzbDE4LTE4IDE4IDE4LTE4IDE4em0xLTM1bDE4LTE4IDE4IDE4LTE4IDE4em0tOTAgODlsMTgtMTggMTggMTgtMTggMTh6bTM1LTM2bDE4LTE4IDE4IDE4LTE4IDE4eiIvPjxwYXRoIGZpbGw9IiMxZGQiIGQ9Ik0xMzQgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em0tMzUgMzZsMTgtMTggMTggMTgtMTggMTh6Ii8+PHBhdGggZmlsbD0iIzJiYiIgZD0iTTExNiAxNDlsMTgtMTggMTggMTgtMTggMTh6bTU0LTU0bDE4LTE4IDE4IDE4LTE4IDE4em0tODkgOTBsMTgtMTggMTggMTgtMTggMTh6bTEzOS04NWwyMyAyM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTI0LTI0Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS01IDEyLTUgMTYgMHoiLz48cGF0aCBmaWxsPSIjM2VlIiBkPSJNMTM0IDk1bDE4LTE4IDE4IDE4LTE4IDE4em0tNTQgMThsMTgtMTcgMTggMTctMTggMTh6bTU1LTUzbDE4LTE4IDE4IDE4LTE4IDE4em05MyA0OGwtOC04Yy00LTUtMTEtNS0xNiAwTDEwMyAyMDFjLTQgNC00IDExIDAgMTVsOCA4Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS00IDEyLTQgMTYgMHoiLz48cGF0aCBmaWxsPSIjOWVlIiBkPSJNMjcgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em01NC01M2wxOC0xOCAxOCAxOC0xOCAxOHoiLz48cGF0aCBmaWxsPSIjMGFhIiBkPSJNMjMwIDExMGwxMyAxM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTEzLTEzYzQgNCAxMSA0IDE1IDBsMTAxLTEwMWM1LTUgNS0xMSAwLTE2eiIvPjxwYXRoIGZpbGw9IiMxYWIiIGQ9Ik0xMzQgMjQ4Yy00IDAtOC0yLTExLTVsLTIzLTIzYTE2IDE2IDAgMDEwLTIzTDIwMSA5NmExNiAxNiAwIDAxMjIgMGwyNCAyNGM2IDYgNiAxNiAwIDIyTDE0NiAyNDNjLTMgMy03IDUtMTIgNXptNzgtMTQ3bC00IDItMTAxIDEwMWE2IDYgMCAwMDAgOWwyMyAyM2E2IDYgMCAwMDkgMGwxMDEtMTAxYTYgNiAwIDAwMC05bC0yNC0yMy00LTJ6Ii8+PC9zdmc+)](https://github.com/renovatebot/renovate)

</div>


## Intro

This repo is for my homelab (that is, the infrastructure that I run in the home). This sits in a 25U Startech open rack.

The underlying platform is Proxmox VE 7 + a Ceph cluster. On top I run a Kubernetes cluster, an OPNSense VM, and misc others.
It is managed with Terraform IaC, and lots of glue and duct tape.

Kubernetes runs on Talos Linux and is managed with [Flux](https://github.com/fluxcd/flux2) (GitOps)

## Hardware

The rack:

![](https://github.com/0dragosh/homelab/blob/main/docs/rack.png?raw=true)


### Compute/Storage

| Device                                               | CPU                             | RAM   | OS        | Disks                                                                   | NICs                                                |
|------------------------------------------------------|---------------------------------|-------|-----------|-------------------------------------------------------------------------|-----------------------------------------------------|
| 1 x Supermicro 847 36 bay 4U X10DRi-T4+ a.k.a Fatman | 2 x Intel Xeon E5-2630L 10c/20t | 356GB | Proxmox 7 | Ceph: 2 x 2TB NVMe 970 Evo Plus, ZFS for about 200TiB raw               | Intel X540 4 x 10GBase-T                            |
| 1 x Node 304 w/ Supermicro X11SDV a.k.a Lilslim      | 1 x Intel Xeon D-2141I          | 160GB | Proxmox 7 | Ceph: 2 x 2TB NVMe 970 Evo Plus through QDA-U2MP, 1 x 1TB QVO SATA SSD  | Intel X722 2 x 10GBase-T, Intel X540 2 x 10GBase-T  |
| 2 x Intel NUC10i7FNK (slim)                          | 1 x i7-10710U 6c/12t            | 64GB  | Proxmox 7 | Ceph: 1 x 1TB NVMe 970 Evo Plus                                         | Thunderbolt Sonnet solo 10GbE                       |
| 1 x Intel NUC10i7FNH (fat)                           | 1 x i7-10710U 6c/12t            | 64GB  | Proxmox 7 | Ceph: 1 x 1TB NVMe 970 Evo Plus, 1 x 1TB QVO SATA SSD                   | Thunderbolt QNAP 10GbE SFP+                         |


### Networking/Other

I have a 1 gig symmetric FTTH link, my GPON is in bridge, that goes in my switch and gets VLAN'd, then my OPNSense picks it up.

| Device                                      | Details                               |
|---------------------------------------------|---------------------------------------|
| APC UPS SMT3000RMI2UNC                      | 3000VA UPS for the whole rack         |
| Unifi Switch Enterprise XG 24               | Main 10gig switch                     |
| Unifi Switch XG 6PoE                        | 10gig PoE switch, to be decomissioned |
| TP-Link Omada OC200                         | Omada controller                      |
| TP-Link Omada TL-SG3428MP                   | Main 1gig switch                      |
| 2 x TP-Link Omada EAP660 HD                 | APs for upstairs & downstairs         |
| PiKVM                                       | KVM for non-IPMI nodes (i.e. NUCs)    |
| 4 x Reolink 811A                            | security cams                         |
| 2 x Dahua IPC-HFW5541E-SE w/ starlight chip | security cams                         |

<br/>


## Thanks

This was all made possible by the wonderful [Kubernetes @Home](https://discord.gg/k8s-at-home) Discord community. Come join us!
