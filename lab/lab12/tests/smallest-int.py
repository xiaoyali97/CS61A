test = {
  'name': 'smallest-int',
  'points': 1,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          sqlite> SELECT * FROM smallest_int;
          4/13/2018 15:16:12|16
          4/13/2018 15:22:11|16
          4/13/2018 15:15:08|17
          4/13/2018 15:18:10|17
          4/13/2018 15:21:43|17
          4/13/2018 15:22:13|17
          4/13/2018 16:07:06|17
          4/13/2018 18:09:26|17
          4/13/2018 18:21:40|17
          4/13/2018 18:35:06|17
          4/13/2018 21:59:38|17
          4/13/2018 23:00:33|17
          4/14/2018 18:40:35|17
          4/13/2018 20:17:16|18
          4/13/2018 15:16:24|19
          4/13/2018 15:23:28|19
          4/13/2018 16:51:30|19
          4/13/2018 18:27:34|20
          4/13/2018 15:21:12|21
          4/13/2018 15:48:22|21
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'ordered': False,
      'scored': True,
      'setup': r"""
      sqlite> .read lab12.sql
      """,
      'teardown': '',
      'type': 'sqlite'
    }
  ]
}
