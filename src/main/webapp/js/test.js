var INDEX = {};


INDEX.test = function() {
    $.ajax({
        url: 'https://cdn.merakianalytics.com/riot/lol/resources/latest/en-US/champions.json',
        method: 'GET',
        dataType : 'jsonp',
        success: function(data) {
            console.log("CDN 데이터 :: ",data);
        },
        error: function(xhr, status, error) {
        }
    });
}