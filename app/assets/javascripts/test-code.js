$(document).on('ready', function(){

  var $add = $("#btn-add");
  var $reduce = $("#btn-reduce");
  var $buynum = $("#buy-num");
  var $max = 99
  var $min = 1


  $(document).on("click", "#btn-add", function(event){
    event.preventDefault();

    var count = Number($buynum.val());
    var number = count + 1;

    if (number >= $max){
      $add.addClass("disabled");
      $reduce.removeClass("disabled");
      $buynum.val($max);
    } else {
      $add.removeClass("disabled");
      $buynum.val(number);
    }
  });

  // reduce
  $(document).on("click", "#btn-reduce", function(event){
    event.preventDefault();

    var count = Number($buynum.val());
    var number = count - 1;

    if (number <= $min){
      $buynum.val($min);
      $reduce.addClass("disabled");
      $add.removeClass("disabled");
    } else {
      $reduce.removeClass("disabled");
      $buynum.val(number);
    }
  });

  // onkeyup

  $(document).on("keyup", "#buy-num", function(event){
    event.preventDefault();

    var t = $.trim( $buynum.val() );
    if ( isNaN(Number(t)) || isEmpty(Number(t)) || isFloat(Number(t)) || Number(t) > $max || Number(t) < $min ) {
      alert("请输入 1～{0} 之间的整数".format($max));
      if (Number(t) > $max){
        $buynum.val($max);
      } else {
        $buynum.val($min);
      }

    } else {
      $buynum.val(Number(t));
    }
  });
});

function isEmpty(t){
  return "" == $.trim(t)
}

function isFloat(t){
  return Number(t) === t && t % 1 !== 0
}


String.prototype.format = function()
{
   var content = this;
   for (var i=0; i < arguments.length; i++)
   {
        var replacement = '{' + i + '}';
        content = content.replace(replacement, arguments[i]);
   }
   return content;
};
