// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.signaturepad
//= require json2.min
//= require foundation
//= require_tree .


$(function() {
  $(document).foundation();
    var signatureOptions = {
        drawOnly: true,
        lineMargin: 0,
        lineTop: 140,
        penColour: '#2D2D2D'
    }

    var mySignaturePad = $('#new_waiver_form');

    mySignaturePad.signaturePad(signatureOptions);

    function clearSignatureOnShake() {
        if (confirm('Clear Signature?')) {
            mySignaturePad.signaturePad().clearCanvas();
        }
    }

    if (typeof window.DeviceMotionEvent != 'undefined') {
        // Shake sensitivity (a lower number is more)
        var sensitivity = 35;

        // Position variables
        var x1 = 0, y1 = 0, z1 = 0, x2 = 0, y2 = 0, z2 = 0;

        // Listen to motion events and update the position
        window.addEventListener('devicemotion', function (e) {
            x1 = e.accelerationIncludingGravity.x;
            y1 = e.accelerationIncludingGravity.y;
            z1 = e.accelerationIncludingGravity.z;
        }, false);

        // Periodically check the position and fire
        // if the change is greater than the sensitivity
        setInterval(function () {
            var change = Math.abs(x1-x2+y1-y2+z1-z2);

            if (change > sensitivity) {
                clearSignatureOnShake();
            }

            // Update new position
            x2 = x1;
            y2 = y1;
            z2 = z1;
        }, 50);
    }
});