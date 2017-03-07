{ srcsysid: "SAP-BP", msgtype: "Foo", interface: "sapbp2xxx_foo",
  timestamp: "2016-12-11 14:13:12 UTC",
  developer: "xn09789",
  deployer: "xn05725",
  hostname: "dfvviseaibrk1",
  environment: "INT_A",
  files: [
      { name: "sapbp2xxx_foo.lnx", 
        path: "/itx/maps/sapbp2xxx_foo/", 
        sha1: "223344aabbcc",
        size: 234
      },
      { name: "sapbp2xxx_foo-tmpl.mdq", 
        path: "/itx/maps/sapbp2xxx_foo/", 
        sha1: "445566aabbcc",
        size: 123
      }
  ],
  db: [
      { table: "cnf_frame2_input",
        keyvalues: [
            instance_class: "XNWI",
            instance_step1: "Batch3P"
        ]
      },
      { table: "cnf_frame2_interface",
        keyvalues: [
            instance_class: "XNWI",
            instance_step1: "Batch3P"
        ]
      }
  ]
}

