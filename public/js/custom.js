/*=========================================================================
 Tweets
========================================================================= */

    function urlToLink(text) {
        var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
        return text.replace(exp, "<a href='$1'>$1</a>");
    }
    function relTime(time_value) {
        time_value = time_value.replace(/(\+[0-9]{4}\s)/ig, "");
        var parsed_date = Date.parse(time_value);
        var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
        var timeago = parseInt((relative_to.getTime() - parsed_date) / 1000);
        if (timeago < 60) return 'less than a minute ago';
        else if (timeago < 120) return 'about a minute ago';
        else if (timeago < (45 * 60)) return (parseInt(timeago / 60)).toString() + ' minutes ago';
        else if (timeago < (90 * 60)) return 'about an hour ago';
        else if (timeago < (24 * 60 * 60)) return 'about ' + (parseInt(timeago / 3600)).toString() + ' hours ago';
        else if (timeago < (48 * 60 * 60)) return '1 day ago';
        else return (parseInt(timeago / 86400)).toString() + ' days ago';
    }

    $('#tweet-list').hide();
    var user = 'envato'; // Set your twitter id
    var count = '2'; // How many feeds do you want. Recommended Max 10 Twitter Api

    $.getJSON('http://api.twitter.com/1/statuses/user_timeline/envato.json?screen_name=' + user + '&count=' + count + '&callback=?',
    function(tweetdata) {
        var tl = $("#tweet-list");
        $.each(tweetdata,
        function(i, tweet) {
            tl.append("<li>&ldquo;" + urlToLink(tweet.text) + "&rdquo;&ndash; " + relTime(tweet.created_at) + "</li>");
        });
    });
	
    setTimeout(function() {
        $('.tweets p').hide();
        $('#tweet-list').show();

    },
    1000);

/*=========================================================================
 Accordion
========================================================================= */

jQuery().ready(function(){
		jQuery('#accordion').accordion({
			autoheight: false
		});
	});

/*=========================================================================
 Close Message box
========================================================================= */

$('.message-box').find('.closemsg').click(function() {
        $(this).parent('.message-box').slideUp(500);
    });
