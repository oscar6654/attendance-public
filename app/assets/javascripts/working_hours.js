$(document).ready(function() {
    $('#working_hours').DataTable( {
        dom: 'Bfrtip',
        "order": [[2, "asc"]],
        "pageLength": 20,
        buttons: [
            {
                extend: 'print',
                text: 'Print All'
            },
            {
                extend: 'print',
                text: 'Print Selected',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export Selected to Excel',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export to Excel',

            }
        ],
        select: true,
        responsive: true
    } );
} );

$(document).ready(function() {
    $('#working_hours1').DataTable( {
        dom: 'Bfrtip',
        "pageLength": 20,
        
        buttons: [
            {
                extend: 'print',
                text: 'Print All'
            },
            {
                extend: 'print',
                text: 'Print Selected',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export Selected to Excel',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export to Excel',

            }
        ],
        select: true,
        
    } );
} );

$(document).ready(function() {
    $('#working_hour3').DataTable( {
        dom: 'Bfrtip',
        "order": [[0, "desc"]],
        "pageLength": 20,
        buttons: [
            {
                extend: 'print',
                text: 'Print All'
            },
            {
                extend: 'print',
                text: 'Print Selected',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export Selected to Excel',
                exportOptions: {
                    modifier: {
                        selected: true
                    }
                }
            },
            {
                extend: 'csv',
                text: 'Export to Excel',

            }
        ],
        select: true,
        responsive: true
    } );
} );

$(document).ready(function() {
    $('#working_hour4').DataTable( {
       "lengthMenu": [[-1], ["All"]],
        responsive: true
    } );
} );


$(document).ready(function() {
        $('#users-table').dataTable({
        "jQueryUI": true,
        "processing": true,
        "serverSide": true,
        'searchable': true,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "ajax": $('#users-table').data('source'),
        pagingType: 'full_numbers'
            }).yadcf([{
        column_number: 0,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 1,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 2,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 3,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 4,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 5,
        filter_type: "text",
        filter_delay: 500,
        filter_default_label: "Filter"
        },
        {
        column_number: 6,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 7,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 8,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 9,
        filter_type: "text",
        filter_delay: 500,
        filter_default_label: "Filter"
        
        }
        ],
        {
            cumulative_filtering: true
        }
        );
        
});


// $(document).ready(function() {
//     $('#working_hours').DataTable( {
//         dom: 'Bfrtip',
// buttons: [
//             'copy', 'excel', 'pdf', 'print'
//         ],
//         select: true
//     } );
// } );



$(document).ready(function() {
        $('#plate-table').dataTable({
        "jQueryUI": true,
        "processing": true,
        "serverSide": true,
        'searchable': true,
        dom: 'Blfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "ajax": $('#plate-table').data('source'),
        pagingType: 'full_numbers'
            }).yadcf([{
        column_number: 0,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 1,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 2,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 3,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 4,
        filter_type: 'text',
        filter_delay: 500,
        filter_default_label: "Filter"
        
        },
        {
        column_number: 5,
        filter_type: "text",
        filter_delay: 500,
        filter_default_label: "Filter"
        }
        ],
        {
            cumulative_filtering: true
        }
        );
        
});