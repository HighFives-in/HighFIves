const allStudentsMock = [
  {
    "name": "Evans Kerr",
    "branch": "Electrical",
    "_id": "5f801b648ece423fdf388ee7",
    "placedStatus": false,
    "cgpa": "7.93",
    "company": "HYDROCOM",
    "email": "undefined.undefined@hydrocom.co.uk"
  },
  {
    "name": "Marie Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Amanda Grant",
    "branch": "Software",
    "_id": "5f801b64e29d28baaf6cc47f",
    "placedStatus": true,
    "cgpa": "8.38",
    "company": "QUILK",
    "email": "undefined.undefined@quilk.us"
  },
  {
    "name": "Barlow Owens",
    "branch": "Software",
    "_id": "5f801b64b1e1b6a0de93cb7e",
    "placedStatus": true,
    "cgpa": "8.26",
    "company": "ZYTRAC",
    "email": "undefined.undefined@zytrac.me"
  },
  {
    "name": "Serrano Andrews",
    "branch": "Electrical",
    "_id": "5f801b64f5ba8e015ff3b4d1",
    "placedStatus": false,
    "cgpa": "7.46",
    "company": "ZOXY",
    "email": "undefined.undefined@zoxy.ca"
  },
  {
    "name": "Lancaster Mathews",
    "branch": "Mechanical",
    "_id": "5f801b642ffce6d6814cd2d2",
    "placedStatus": true,
    "cgpa": "7.45",
    "company": "ZILIDIUM",
    "email": "undefined.undefined@zilidium.info"
  },
  {
    "name": "Mccullough Strickland",
    "branch": "Software",
    "_id": "5f801b64ef749f3719036bd0",
    "placedStatus": false,
    "cgpa": "8.03",
    "company": "FLUMBO",
    "email": "undefined.undefined@flumbo.org"
  },
  {
    "name": "Nettie Hamilton",
    "branch": "Mechanical",
    "_id": "5f801b649a825c636d4dcb6d",
    "placedStatus": true,
    "cgpa": "8.62",
    "company": "CEDWARD",
    "email": "undefined.undefined@cedward.name"
  },
  {
    "name": "Moore Banks",
    "branch": "Mechanical",
    "_id": "5f801b64cb0c7b715b9d6da7",
    "placedStatus": false,
    "cgpa": "7.45",
    "company": "GYNK",
    "email": "undefined.undefined@gynk.io"
  },
  {
    "name": "Callahan Vinson",
    "branch": "Electrical",
    "_id": "5f801b64c5ce63b944d453ab",
    "placedStatus": false,
    "cgpa": "8.18",
    "company": "XYQAG",
    "email": "undefined.undefined@xyqag.biz"
  },
  {
    "name": "Evans Kerr",
    "branch": "Electrical",
    "_id": "5f801b648ece423fdf388ee7",
    "placedStatus": false,
    "cgpa": "7.93",
    "company": "HYDROCOM",
    "email": "undefined.undefined@hydrocom.co.uk"
  },
  {
    "name": "Marie Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Amanda Grant",
    "branch": "Software",
    "_id": "5f801b64e29d28baaf6cc47f",
    "placedStatus": true,
    "cgpa": "8.38",
    "company": "QUILK",
    "email": "undefined.undefined@quilk.us"
  },
  {
    "name": "Barlow Owens",
    "branch": "Software",
    "_id": "5f801b64b1e1b6a0de93cb7e",
    "placedStatus": true,
    "cgpa": "8.26",
    "company": "ZYTRAC",
    "email": "undefined.undefined@zytrac.me"
  },
  {
    "name": "Serrano Andrews",
    "branch": "Electrical",
    "_id": "5f801b64f5ba8e015ff3b4d1",
    "placedStatus": false,
    "cgpa": "7.46",
    "company": "ZOXY",
    "email": "undefined.undefined@zoxy.ca"
  },
  {
    "name": "Lancaster Mathews",
    "branch": "Mechanical",
    "_id": "5f801b642ffce6d6814cd2d2",
    "placedStatus": true,
    "cgpa": "7.45",
    "company": "ZILIDIUM",
    "email": "undefined.undefined@zilidium.info"
  },
  {
    "name": "Mccullough Strickland",
    "branch": "Software",
    "_id": "5f801b64ef749f3719036bd0",
    "placedStatus": false,
    "cgpa": "8.03",
    "company": "FLUMBO",
    "email": "undefined.undefined@flumbo.org"
  },
  {
    "name": "Nettie Hamilton",
    "branch": "Mechanical",
    "_id": "5f801b649a825c636d4dcb6d",
    "placedStatus": true,
    "cgpa": "8.62",
    "company": "CEDWARD",
    "email": "undefined.undefined@cedward.name"
  },
  {
    "name": "Moore Banks",
    "branch": "Mechanical",
    "_id": "5f801b64cb0c7b715b9d6da7",
    "placedStatus": false,
    "cgpa": "7.45",
    "company": "GYNK",
    "email": "undefined.undefined@gynk.io"
  },
  {
    "name": "Callahan Vinson",
    "branch": "Electrical",
    "_id": "5f801b64c5ce63b944d453ab",
    "placedStatus": false,
    "cgpa": "8.18",
    "company": "XYQAG",
    "email": "undefined.undefined@xyqag.biz"
  },
  {
    "name": "Akash Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Evans Kerr",
    "branch": "Electrical",
    "_id": "5f801b648ece423fdf388ee7",
    "placedStatus": false,
    "cgpa": "7.93",
    "company": "HYDROCOM",
    "email": "undefined.undefined@hydrocom.co.uk"
  },
  {
    "name": "Marie Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Amanda Grant",
    "branch": "Software",
    "_id": "5f801b64e29d28baaf6cc47f",
    "placedStatus": true,
    "cgpa": "8.38",
    "company": "QUILK",
    "email": "undefined.undefined@quilk.us"
  },
  {
    "name": "Barlow Owens",
    "branch": "Software",
    "_id": "5f801b64b1e1b6a0de93cb7e",
    "placedStatus": true,
    "cgpa": "8.26",
    "company": "ZYTRAC",
    "email": "undefined.undefined@zytrac.me"
  },
  {
    "name": "Serrano Andrews",
    "branch": "Electrical",
    "_id": "5f801b64f5ba8e015ff3b4d1",
    "placedStatus": false,
    "cgpa": "7.46",
    "company": "ZOXY",
    "email": "undefined.undefined@zoxy.ca"
  },
  {
    "name": "Lancaster Mathews",
    "branch": "Mechanical",
    "_id": "5f801b642ffce6d6814cd2d2",
    "placedStatus": true,
    "cgpa": "7.45",
    "company": "ZILIDIUM",
    "email": "undefined.undefined@zilidium.info"
  },
  {
    "name": "Mccullough Strickland",
    "branch": "Software",
    "_id": "5f801b64ef749f3719036bd0",
    "placedStatus": false,
    "cgpa": "8.03",
    "company": "FLUMBO",
    "email": "undefined.undefined@flumbo.org"
  },
  {
    "name": "Nettie Hamilton",
    "branch": "Mechanical",
    "_id": "5f801b649a825c636d4dcb6d",
    "placedStatus": true,
    "cgpa": "8.62",
    "company": "CEDWARD",
    "email": "undefined.undefined@cedward.name"
  },
  {
    "name": "Moore Banks",
    "branch": "Mechanical",
    "_id": "5f801b64cb0c7b715b9d6da7",
    "placedStatus": false,
    "cgpa": "7.45",
    "company": "GYNK",
    "email": "undefined.undefined@gynk.io"
  },
  {
    "name": "Callahan Vinson",
    "branch": "Electrical",
    "_id": "5f801b64c5ce63b944d453ab",
    "placedStatus": false,
    "cgpa": "8.18",
    "company": "XYQAG",
    "email": "undefined.undefined@xyqag.biz"
  },
  {
    "name": "Evans Kerr",
    "branch": "Electrical",
    "_id": "5f801b648ece423fdf388ee7",
    "placedStatus": false,
    "cgpa": "7.93",
    "company": "HYDROCOM",
    "email": "undefined.undefined@hydrocom.co.uk"
  },
  {
    "name": "Marie Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Amanda Grant",
    "branch": "Software",
    "_id": "5f801b64e29d28baaf6cc47f",
    "placedStatus": true,
    "cgpa": "8.38",
    "company": "QUILK",
    "email": "undefined.undefined@quilk.us"
  },
  {
    "name": "Barlow Owens",
    "branch": "Software",
    "_id": "5f801b64b1e1b6a0de93cb7e",
    "placedStatus": true,
    "cgpa": "8.26",
    "company": "ZYTRAC",
    "email": "undefined.undefined@zytrac.me"
  },
  {
    "name": "Serrano Andrews",
    "branch": "Electrical",
    "_id": "5f801b64f5ba8e015ff3b4d1",
    "placedStatus": false,
    "cgpa": "7.46",
    "company": "ZOXY",
    "email": "undefined.undefined@zoxy.ca"
  },
  {
    "name": "Lancaster Mathews",
    "branch": "Mechanical",
    "_id": "5f801b642ffce6d6814cd2d2",
    "placedStatus": true,
    "cgpa": "7.45",
    "company": "ZILIDIUM",
    "email": "undefined.undefined@zilidium.info"
  },
  {
    "name": "Mccullough Strickland",
    "branch": "Software",
    "_id": "5f801b64ef749f3719036bd0",
    "placedStatus": false,
    "cgpa": "8.03",
    "company": "FLUMBO",
    "email": "undefined.undefined@flumbo.org"
  },
  {
    "name": "Nettie Hamilton",
    "branch": "Mechanical",
    "_id": "5f801b649a825c636d4dcb6d",
    "placedStatus": true,
    "cgpa": "8.62",
    "company": "CEDWARD",
    "email": "undefined.undefined@cedward.name"
  },
  {
    "name": "Moore Banks",
    "branch": "Mechanical",
    "_id": "5f801b64cb0c7b715b9d6da7",
    "placedStatus": false,
    "cgpa": "7.45",
    "company": "GYNK",
    "email": "undefined.undefined@gynk.io"
  },
  {
    "name": "Callahan Vinson",
    "branch": "Electrical",
    "_id": "5f801b64c5ce63b944d453ab",
    "placedStatus": false,
    "cgpa": "8.18",
    "company": "XYQAG",
    "email": "undefined.undefined@xyqag.biz"
  },
  {
    "name": "Evans Kerr",
    "branch": "Electrical",
    "_id": "5f801b648ece423fdf388ee7",
    "placedStatus": false,
    "cgpa": "7.93",
    "company": "HYDROCOM",
    "email": "undefined.undefined@hydrocom.co.uk"
  },
  {
    "name": "Marie Hines",
    "branch": "Electrical",
    "_id": "5f801b643964eb714c2710b3",
    "placedStatus": true,
    "cgpa": "9.50",
    "company": "PORTICO",
    "email": "undefined.undefined@portico.net"
  },
  {
    "name": "Amanda Grant",
    "branch": "Software",
    "_id": "5f801b64e29d28baaf6cc47f",
    "placedStatus": true,
    "cgpa": "8.38",
    "company": "QUILK",
    "email": "undefined.undefined@quilk.us"
  },
  {
    "name": "Barlow Owens",
    "branch": "Software",
    "_id": "5f801b64b1e1b6a0de93cb7e",
    "placedStatus": true,
    "cgpa": "8.26",
    "company": "ZYTRAC",
    "email": "undefined.undefined@zytrac.me"
  },
  {
    "name": "Serrano Andrews",
    "branch": "Electrical",
    "_id": "5f801b64f5ba8e015ff3b4d1",
    "placedStatus": false,
    "cgpa": "7.46",
    "company": "ZOXY",
    "email": "undefined.undefined@zoxy.ca"
  },
  {
    "name": "Lancaster Mathews",
    "branch": "Mechanical",
    "_id": "5f801b642ffce6d6814cd2d2",
    "placedStatus": true,
    "cgpa": "7.45",
    "company": "ZILIDIUM",
    "email": "undefined.undefined@zilidium.info"
  },
  {
    "name": "Mccullough Strickland",
    "branch": "Software",
    "_id": "5f801b64ef749f3719036bd0",
    "placedStatus": false,
    "cgpa": "8.03",
    "company": "FLUMBO",
    "email": "undefined.undefined@flumbo.org"
  },
  {
    "name": "Nettie Hamilton",
    "branch": "Mechanical",
    "_id": "5f801b649a825c636d4dcb6d",
    "placedStatus": true,
    "cgpa": "8.62",
    "company": "CEDWARD",
    "email": "undefined.undefined@cedward.name"
  },
  {
    "name": "Moore Banks",
    "branch": "Mechanical",
    "_id": "5f801b64cb0c7b715b9d6da7",
    "placedStatus": false,
    "cgpa": "7.45",
    "company": "GYNK",
    "email": "undefined.undefined@gynk.io"
  },
  {
    "name": "Callahan Vinson",
    "branch": "Electrical",
    "_id": "5f801b64c5ce63b944d453ab",
    "placedStatus": false,
    "cgpa": "8.18",
    "company": "XYQAG",
    "email": "undefined.undefined@xyqag.biz"
  }
];
