{ 
   "branding":{ 
      "browser_title":"Solutions | C&J ",
      "title":"Solutions - Courts and Justice"
   },
   "tag_list":[ 
      "Overview",
      "Clearance Rate",
      "Age of Active Pending",
      "Time to Disposition",
      "Trial Date Certainty"
   ],
   "date":{ 
      "startDate":"2018-1-1",
      "endDate":"2020-01-31"
   },
   "template_entries":[ 
      { 
         "name":"Courts and Justice",
         "description":"",
         "dataset_domain":"courtsandjustice.demo.socrata.com",
         "dataset_id":"xzug-disn",
         "fields":{ 
            "date_column":"statusdate",
            "incident_type":"odysseycasecategorydescription"
         },
         "dimension_entries":[ 
            { 
               "column":"county",
               "name":"County"
            },
            { 
               "column":"casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"judgeid",
               "name":"Judge ID"
            }
         ],
         "group_by_entries":[ 
            { 
               "column":"county",
               "name":"County"
            },
            { 
               "column":"casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"judgeid",
               "name":"Judge ID"
            }
         ],
         "view_entries":[ 
            { 
               "name":"Clearance Rate",
               "column":"sum(case(isactive='false', 1))/sum(case(isactive='true', 1))*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"2",
               "prefix":"",
               "suffix":"%",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"80",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               }
            },
            { 
               "name":"Beginning Active Pending Backlog",
               "column":"casebacklog",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"pending events",
               "end_date_override_and_ignore":"true",
               "start_date_boolean_override":"<",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"incoming events"
                  },
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"outgoing events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Current Active Pending Backlog",
               "column":"casebacklog",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"pending events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"incoming events"
                  },
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"outgoing events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"End Active Pending Backlog",
               "column":"casebacklog",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"pending events",
               "start_date_override_and_ignore":"true",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"incoming events"
                  },
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"outgoing events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Outgoing Cases",
               "column":"sum(case(isactive='false', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Outgoing Cases: Entry of Judgement",
               "column":"sum(case(eventstatusmappingcodede='Jury Trial Disposition' or eventstatusmappingcodede='Non-Trial Disposition' or eventstatusmappingcodede='Bench/Non-Jury Trial Disposition' , 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Outgoing Cases: Placed On Inactive Status",
               "column":"sum(case(eventstatusmappingcodede='Placed on Inactive Status', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Incoming Cases",
                     "column":"sum(case(isactive='true', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Incoming Cases",
               "column":"sum(case(isactive='true', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Incoming Cases: New Filing",
               "column":"sum(case(eventstatusmappingcodede='New Filing', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Incoming Cases: Reopened",
               "column":"sum(case(eventstatusmappingcodede='Reopened', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            },
            { 
               "name":"Incoming Cases: Reactivated",
               "column":"sum(case(eventstatusmappingcodede='Reactivated', 1))",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"events",
               "tags":[ 
                  "Clearance Rate"
               ],
               "target_entries":[ 

               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart",
                     "default_comparison_column_entry":"casenumber",
                     "show_pie_chart":"true"
                  },
                  "overtime":{ 
                     "show_area_chart":"true",
                     "show_timeline_total":"false"
                  }
               },
               "comparison_column_entries":[ 
                  { 
                     "name":"Outgoing Cases",
                     "column":"sum(case(isactive='false', 1))",
                     "aggregate_type":"",
                     "render_type":"bullet",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  },
                  { 
                     "name":"Event Status Mapping Code",
                     "column":"eventstatusmappingcodede",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "precision":"0",
                     "prefix":"",
                     "suffix":"events"
                  }
               ]
            }
         ],
         "filter_by_entries":[ 
            { 
               "column":"isactive",
               "name":"Active Case?"
            },
            { 
               "column":"eventstatusmappingcodede",
               "name":"Disposition"
            }
         ],
         "leaf_page_entries":[ 
            { 
               "column":"judgeid",
               "name":"Judge ID"
            },
            { 
               "column":"casenumber",
               "name":"Case Number"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"casetypedescription",
               "name":"Case Type "
            }
         ],
         "quick_filter_entries":[ 
            { 
               "column":"casecategorydescription",
               "name":"Case Category",
               "renderType":"text"
            }
         ],
         "bench_mark_entries":[ 
            { 
               "view_column":"caseid",
               "dimension_column":"judgeid",
               "display_name":"State Standard",
               "value":"50"
            }
         ],
         "map":{ 
            "centerLat":"44.40861110588011",
            "centerLng":"-115.16737594966821",
            "zoom":"3",
            "shapes_outline_highlight_width":"4",
            "style_entries":[ 
               { 
                  "name":"Street",
                  "style":"mapbox://styles/mapbox/streets-v10"
               },
               { 
                  "name":"Light",
                  "style":"mapbox://styles/mapbox/light-v9"
               },
               { 
                  "name":"Dark",
                  "style":"mapbox://styles/mapbox/dark-v9"
               },
               { 
                  "name":"Satelite",
                  "style":"mapbox://styles/mapbox/satellite-v9"
               },
               { 
                  "name":"Outdoors",
                  "style":"mapbox://styles/mapbox/outdoors-v10"
               }
            ]
         },
         "shape_dataset_entries":[ 

         ],
         "shape_outline_dataset_entries":[ 

         ]
      },
      { 
         "name":"Time to Disposition",
         "description":"",
         "dataset_domain":"courtsandjustice.demo.socrata.com",
         "dataset_id":"x3q2-qjbe",
         "fields":{ 
            "date_column":"lastcloseddate"
         },
         "dimension_entries":[ 
            { 
               "column":"casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"judgeid",
               "name":"Judge ID"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"county",
               "name":"County"
            }
         ],
         "group_by_entries":[ 
            { 
               "column":"casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"judgeid",
               "name":"Judge ID"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"county",
               "name":"County"
            }
         ],
         "view_entries":[ 
            { 
               "name":"Mean Time To Disposition",
               "column":"timetodisposition",
               "aggregate_type":"avg",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"days",
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":"<=",
                     "value":"30",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Median Time To Disposition",
               "column":"timetodisposition",
               "aggregate_type":"median",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"days",
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":"<=",
                     "value":"30",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Number of Cases With Time To Disposition < 30 Days",
               "column":"timetodisposition_flag",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"cases",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 30, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Number of Cases With Time To Disposition < 60 Days",
               "column":"timetodisposition_flag",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"cases",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 60, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Number of Cases With Time To Disposition < 90 Days",
               "column":"timetodisposition_flag",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"cases",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 90, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Number of Cases With Time To Disposition < 180 Days",
               "column":"timetodisposition_flag",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"cases",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 180, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Number of Cases With Time To Disposition < 365 Days",
               "column":"timetodisposition_flag",
               "aggregate_type":"sum",
               "use_dimension_value":"true",
               "precision":"0",
               "prefix":"",
               "suffix":"cases",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 365, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"90",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Percentage of Cases With Time To Disposition < 30 Days",
               "column":"sum(timetodisposition_flag)/count(*)*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 30, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"timetodisposition_flag",
                     "name":"Cases",
                     "aggregate_type":"sum",
                     "render_type":"bullet",
                     "prefix":"",
                     "suffix":"cases",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Percentage of Cases With Time To Disposition < 60 Days",
               "column":"sum(timetodisposition_flag)/count(*)*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 60, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Percentage of Cases With Time To Disposition < 90 Days",
               "column":"sum(timetodisposition_flag)/count(*)*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 90, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Percentage of Cases With Time To Disposition < 180 Days",
               "column":"sum(timetodisposition_flag)/count(*)*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 180, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"75",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            },
            { 
               "name":"Percentage of Cases With Time To Disposition < 365 Days",
               "column":"sum(timetodisposition_flag)/count(*)*100",
               "aggregate_type":"",
               "use_dimension_value":"true",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "parent_queries":[ 
                  "select  *, case(timetodisposition < 365, 1) as timetodisposition_flag"
               ],
               "fields":{ 
                  "date_column":"lastopeneddate"
               },
               "comparison_column_entries":[ 
                  { 
                     "column":"casetypedescription",
                     "name":"Case Type",
                     "aggregate_type":"",
                     "render_type":"stack",
                     "prefix":"",
                     "suffix":"",
                     "precision":""
                  }
               ],
               "tags":[ 
                  "Time to Disposition"
               ],
               "target_entries":[ 
                  { 
                     "name":"On track",
                     "color":"#259652",
                     "operator":">=",
                     "value":"90",
                     "icon":"icons-check-circle"
                  },
                  { 
                     "name":"Off track",
                     "color":"#e31219",
                     "icon":"icons-times-circle"
                  }
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"groupChart"
                  }
               }
            }
         ],
         "filter_by_entries":[ 
            { 
               "column":"judgeid",
               "name":"Judge ID"
            }
         ],
         "leaf_page_entries":[ 
            { 
               "column":"casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"judgeid",
               "name":"Judge ID"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"county",
               "name":"County"
            }
         ],
         "quick_filter_entries":[ 
            { 
               "column":"casetypedescription",
               "name":"Case Type",
               "renderType":"text"
            }
         ],
         "bench_mark_entries":[ 
            { 
               "view_column":"caseid",
               "dimension_column":"judgeid",
               "display_name":"State Standard",
               "value":"50"
            }
         ],
         "map":{ 
            "centerLat":"44.40861110588011",
            "centerLng":"-115.16737594966821",
            "zoom":"3",
            "shapes_outline_highlight_width":"4",
            "style_entries":[ 
               { 
                  "name":"Street",
                  "style":"mapbox://styles/mapbox/streets-v10"
               },
               { 
                  "name":"Light",
                  "style":"mapbox://styles/mapbox/light-v9"
               },
               { 
                  "name":"Dark",
                  "style":"mapbox://styles/mapbox/dark-v9"
               },
               { 
                  "name":"Satelite",
                  "style":"mapbox://styles/mapbox/satellite-v9"
               },
               { 
                  "name":"Outdoors",
                  "style":"mapbox://styles/mapbox/outdoors-v10"
               }
            ]
         },
         "shape_dataset_entries":[ 

         ],
         "shape_outline_dataset_entries":[ 

         ]
      },
      { 
         "name":"Court Operations",
         "dataset_domain":"courtsandjustice.demo.socrata.com",
         "dataset_id":"hqva-gm7v",
         "default_view":"Snapshot",
         "fields":{ 
            "date_column":"disposition_date"
         },
         "dimension_entries":[ 
            { 
               "column":"last_casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"last_casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"last_hearingjudgeid",
               "name":"Judge ID"
            },
            { 
               "column":"last_nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"last_county",
               "name":"County"
            },
            { 
               "column":"casenumber",
               "name":"Case Number"
            }
         ],
         "group_by_entries":[ 
            { 
               "column":"last_casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"last_casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"last_hearingjudgeid",
               "name":"Judge ID"
            },
            { 
               "column":"last_nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"last_county",
               "name":"County"
            },
            { 
               "column":"casenumber",
               "name":"Case Number"
            }
         ],
         "view_entries":[ 
            { 
               "name":"Trial Date Certainty",
               "column":"sum(certainty_count)/count(*)*100",
               "parent_queries":[ 
                  "select count(hearingdate) as total_hearing_dates,casenumber,max(dispositiondate) as disposition_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, max(casetypedescription) as last_casetypedescription, max(casecategorydescription) as last_casecategorydescription, max(casecategorydescription) as last_casecategorymappingdescription, max(hearingjudgeid) as last_hearingjudgeid, max(nodedescription) as last_nodedescription, max(county) as last_county group by casenumber |> select disposition_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, last_hearingjudgeid, last_nodedescription, last_county, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
               ],
               "aggregate_type":"",
               "precision":"1",
               "prefix":"",
               "suffix":"%",
               "tags":[ 
                  "Trial Date Certainty"
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"barChart"
                  }
               }
            },
            { 
               "name":"Average Number of Settings",
               "column":"total_hearing_dates",
               "parent_queries":[ 
                  "select count(hearingdate) as total_hearing_dates,casenumber,max(dispositiondate) as disposition_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, max(casetypedescription) as last_casetypedescription, max(casecategorydescription) as last_casecategorydescription, max(casecategorydescription) as last_casecategorymappingdescription, max(hearingjudgeid) as last_hearingjudgeid, max(nodedescription) as last_nodedescription, max(county) as last_county group by casenumber |> select disposition_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, last_hearingjudgeid, last_nodedescription, last_county, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
               ],
               "aggregate_type":"avg",
               "precision":"1",
               "prefix":"",
               "suffix":"settings",
               "tags":[ 
                  "Trial Date Certainty"
               ],
               "visualization":{ 
                  "default_view":"Snapshot",
                  "snapshot":{ 
                     "chart_type":"barChart"
                  }
               }
            }
         ],
         "leaf_page_entries":[ 
            { 
               "column":"last_casetypedescription",
               "name":"Case Type"
            },
            { 
               "column":"last_casecategorydescription",
               "name":"Case Category"
            },
            { 
               "column":"last_hearingjudgeid",
               "name":"Judge ID"
            },
            { 
               "column":"nodedescription",
               "name":"Court Name"
            },
            { 
               "column":"last_county",
               "name":"County"
            },
            { 
               "column":"casenumber",
               "name":"Case Number"
            }
         ],
         "map":{ 
            "centerLat":"42.038333",
            "centerLng":"-88.322778",
            "zoom":"10",
            "shapes_outline_highlight_width":"4",
            "style_entries":[ 
               { 
                  "name":"Street",
                  "style":"mapbox://styles/mapbox/streets-v10"
               },
               { 
                  "name":"Light",
                  "style":"mapbox://styles/mapbox/light-v9"
               },
               { 
                  "name":"Dark",
                  "style":"mapbox://styles/mapbox/dark-v9"
               },
               { 
                  "name":"Satelite",
                  "style":"mapbox://styles/mapbox/satellite-v9"
               },
               { 
                  "name":"Outdoors",
                  "style":"mapbox://styles/mapbox/outdoors-v10"
               }
            ]
         }
      }
   ]
}
