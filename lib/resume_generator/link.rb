require 'decodable'

module ResumeGenerator
  class Link
    extend Decodable

    LINK_BANK = {
      sra:
        'aHR0cDovL3d3dy5zcmEuY28uanAvaW5kZXgtZW4uc2h0bWw=',
      sra_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPSVFMyU4MCU5MjE3MS04NTEzJUU2JTlEJUIxJU"\
          "U0JUJBJUFDJUU5JTgzJUJEJUU4JUIxJThBJUU1JUIzJUI2JUU1JThDJUJBJUU"\
          "1JThEJTk3JUU2JUIxJUEwJUU4JUEyJThCMi0zMi04JmFxPSZzbGw9MzUuNzI2"\
          "NjAxLDEzOS43MTU1MDgmc3Nwbj0wLjAwNzAzOCwwLjAwODk0OCZ2cHNyYz0wJ"\
          "mllPVVURjgmaHE9JmhuZWFyPUphcGFuLCtUJUM1JThEa3klQzUlOEQtdG8sK1"\
          "Rvc2hpbWEta3UsK01pbmFtaWlrZWJ1a3VybywrJUVGJUJDJTkyJUU0JUI4JTg"\
          "xJUU3JTlCJUFFJUVGJUJDJTkzJUVGJUJDJTkyJUUyJTg4JTkyJUVGJUJDJTk4"\
          "JnQ9bSZ6PTE3Jml3bG9jPUE=",
      jet:
        "aHR0cDovL3d3dy5qZXRwcm9ncmFtbWUub3JnL2UvYXNwaXJpbmcvcG9zaXRpb25"\
          "zLmh0bWw=",
      jet_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPSVFMyU4MCU5Mjc4MC0wODUwJUU5JUFCJTk4JU"\
          "U3JTlGJUE1JUU1JUI4JTgyJUU0JUI4JUI4JUUzJTgzJThFJUU1JTg2JTg1MSV"\
          "FNCVCOCU4MSVFNyU5QiVBRTclRTclOTUlQUE1MiVFNSU4RiVCNyZhcT0mc2xs"\
          "PS0zNC45NjE2OTIsMTM4LjYyMTM5OSZzc3BuPTAuMDU2ODM2LDAuMDcxNTgzJ"\
          "nZwc3JjPTYmaWU9VVRGOCZocT0maG5lYXI9SmFwYW4sK0slQzUlOERjaGkta2"\
          "VuLCtLJUM1JThEY2hpLXNoaSwrTWFydW5vdWNoaSwrJUVGJUJDJTkxJUU0JUI"\
          "4JTgxJUU3JTlCJUFFJUVGJUJDJTk3JUUyJTg4JTkyJUVGJUJDJTk1JUVGJUJD"\
          "JTkyJmxsPTMzLjU1OTQ1NiwxMzMuNTI4MzA0JnNwbj0wLjAxNDQ0OCwwLjAxN"\
          "zg5NiZ0PW0mej0xNiZpd2xvYz1B",
      satc:
        'aHR0cDovL3d3dy5zb3V0aGF1c3RyYWxpYS5jb20v',
      satc_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPTUwK0dyZW5mZWxsK1N0LCtBZGVsYWlkZStTQS"\
          "ZhcT0mc2xsPS0zNC45MjQyMjMsMTM4LjYwMTcxMyZzc3BuPTAuMDU3MTQzLDA"\
          "uMDcxNTgzJnZwc3JjPTYmZz01MCtHcmVuZmVsbCtTdCwrQWRlbGFpZGUrU0Em"\
          "aWU9VVRGOCZocT0maG5lYXI9NTArR3JlbmZlbGwrU3QsK0FkZWxhaWRlK1Nvd"\
          "XRoK0F1c3RyYWxpYSs1MDAwJmxsPS0zNC45MjQwODIsMTM4LjYwMTY5MiZzcG"\
          "49MC4wMTQyMTUsMC4wMTc4OTYmdD1tJno9MTYmaXdsb2M9QQ==",
      mit:
        'aHR0cHM6Ly93d3cudW5pc2EuZWR1LmF1Lw==',
      mit_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPTU1K05vcnRoK1RlcnJhY2UsK0FkZWxhaWRlK1"\
          "NBKzUwMDAmc2xsPS0zNC45NjE2OTIsMTM4LjYyMTM5OSZzc3BuPTAuMDU2ODM"\
          "2LDAuMDcxNTgzJnZwc3JjPTYmaWU9VVRGOCZocT0maG5lYXI9NTUrTm9ydGgr"\
          "VGVycmFjZSwrQWRlbGFpZGUsK1NvdXRoK0F1c3RyYWxpYSs1MDAwJmxsPS0zN"\
          "C45MjIxODIsMTM4LjU5MDg1NiZzcG49MC4wMjg0MzIsMC4wMzU3OTEmdD1tJn"\
          "o9MTUmaXdsb2M9QQ==",
      bib:
        'aHR0cDovL3d3dy5mbGluZGVycy5lZHUuYXUv',
      bib_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPVN0dXJ0K1JkLCtCZWRmb3JkK1BhcmsrU0ErNT"\
          "A0MiZhcT0mc2xsPS0zNC45MjIxODIsMTM4LjU5MDg1NiZzc3BuPTAuMDI4NDM"\
          "yLDAuMDM1NzkxJnZwc3JjPTYmaWU9VVRGOCZocT0maG5lYXI9U3R1cnQrUmQs"\
          "K0JlZGZvcmQrUGFyaytTb3V0aCtBdXN0cmFsaWErNTA0MiZsbD0tMzUuMDE2N"\
          "zgyLDEzOC41Njc5ODImc3BuPTAuMDU2Nzk4LDAuMDcxNTgzJnQ9bSZ6PTE0Jm"\
          "l3bG9jPUE=",
      ryu:
        'aHR0cDovL3d3dy5yeXVrb2t1LmFjLmpwL2VuZ2xpc2gyL2luZGV4LnBocA==',
      ryu_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPSVFNCVCQSVBQyVFOSU4MyVCRCVFNSVCQSU5Qy"\
          "VFNCVCQSVBQyVFOSU4MyVCRCVFNSVCOCU4MiVFNCVCQyU4RiVFOCVBNiU4QiV"\
          "FNSU4QyVCQSVFNiVCNyVCMSVFOCU4RCU4OSVFNSVBMSU5QSVFNiU5QyVBQyVF"\
          "NyU5NCVCQSVFRiVCQyU5NiVFRiVCQyU5NyZhcT0mc2xsPS0zNS4wMTY3ODIsM"\
          "TM4LjU2Nzk4MiZzc3BuPTAuMDU2Nzk4LDAuMDcxNTgzJnZwc3JjPTYmZz1TdH"\
          "VydCtSZCwrQmVkZm9yZCtQYXJrK1NvdXRoK0F1c3RyYWxpYSs1MDQyJmllPVV"\
          "URjgmaHE9JmhuZWFyPUphcGFuLCtLeSVDNSU4RHRvLWZ1LCtLeSVDNSU4RHRv"\
          "LXNoaSwrRnVzaGltaS1rdSwrRnVrYWt1c2ErVHN1a2Ftb3RvY2glQzUlOEQsK"\
          "yVFRiVCQyU5NiVFRiVCQyU5NyZsbD0zNC45NjM5NzQsMTM1Ljc2Nzk3JnNwbj"\
          "0wLjAwNzEwNCwwLjAwODk0OCZ0PW0mej0xNyZpd2xvYz1B",
      tafe:
        'aHR0cDovL3d3dy50YWZlc2EuZWR1LmF1',
      tafe_location:
        "aHR0cHM6Ly9tYXBzLmdvb2dsZS5jb20uYXUvbWFwcz9mPXEmc291cmNlPXNfc"\
          "SZobD1lbiZnZW9jb2RlPSZxPTEyMCtDdXJyaWUrU3RyZWV0K0FERUxBSURFK1"\
          "NBKzUwMDAmYXE9JnNsbD0zNC45NjM5NzQsMTM1Ljc2Nzk3JnNzcG49MC4wMDc"\
          "xMDQsMC4wMDg5NDgmdnBzcmM9NiZpZT1VVEY4JmhxPSZobmVhcj0xMjArQ3Vy"\
          "cmllK1N0LCtBZGVsYWlkZStTb3V0aCtBdXN0cmFsaWErNTAwMCZ0PW0mbGw9L"\
          "TM0LjkyNDU0LDEzOC41OTU1MTImc3BuPTAuMDE0MjE1LDAuMDE3ODk2Jno9MT"\
          "YmaXdsb2M9QQ=="
    }

    def self.for(resource)
      d(LINK_BANK.fetch(:"#{resource}"))
    end
  end
end
