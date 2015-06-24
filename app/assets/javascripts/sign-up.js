if (!signUp) var signUp = {};
signUp.availability = function() {
	var src = '';

	this.init = function() {
		_setUpCheckBoxes();
		_setUpCheckBoxesBooking();
	}

	//Set up any checkbox interactivity we need
	function _setUpCheckBoxes() {
		//Only interested in running this on availability sign-up page
		if ($('.container-mentor-onboard.availability').length < 1)
		{
			return;
		}

		$('.checkbox').bind('click', _checkBoxListener);
		src = $('.checked-src').attr('src');
		$('.custom-timeslots').prev().find('.checkbox').bind('click', _toggleCustomTimes);
		_setUpCustomTimeSlots();
	}
	
	function _setUpCheckBoxesBooking() {
		//Only interested in running this in booking section page
		if ($('.checkbox-row-booking').length < 1)
		{
			return;
		}

		//set up listener for timeslot links
		//$('.checkbox-row-booking input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		//.css("visibility", "hidden")
		$('.checkbox-row-booking input[type="checkbox"]').hide().after('<div class="checkbox"></div>');
		
		$('.checkbox').bind('click', _checkBoxListener2);
		src = $('.checked-src').attr('src');

	}

	//Listener for when .checkbox divs are checked. Add checked icon and alter real checkbox
	function _checkBoxListener() {
		var $this = $(this);
		var $input = $this.siblings('.hidden-checkbox-container').find('input');
		if ($input.is(':checked')) {
			$this.html('');
			$input.checked = false;
			$this.removeClass('checked-active');
		}
		else {
			var label = $this.siblings('.period').html();
			//Check to see if All Day or Custom is being checked. If so uneheck other checkboxes
			if (label.indexOf('All Day') > -1 || label.indexOf('Custom') > -1) {
				$this.parent().parent().siblings().each(function() {
					var $otherCheckboxWrapper = $(this);
					$otherCheckboxWrapper.find('.checkbox').removeClass('checked-active');
					$otherCheckboxWrapper.find('input').checked = false;
				});
			}
			//If not All Day or Custom, make sure All Day and Custom are not checked.
			else {
				$this.parent().parent().siblings().each(function() {
					var $otherRowWrapper = $(this);
					if ($otherRowWrapper.hasClass('custom-timeslots')) {
						$otherRowWrapper.hide();
						return;
					}
					var $otherCheckBox = $otherRowWrapper.find('.checkbox');
					var otherLabel = $otherCheckBox.siblings('.period').html();
					if (otherLabel.indexOf('All Day') > -1 || otherLabel.indexOf('Custom') > -1) {
						$otherCheckBox.html('');
						$otherCheckBox.removeClass('checked-active');
						$otherCheckBox.siblings('.hidden-checkbox-container').find('input').checked = false;
					}
				});
			}
			$this.addClass('checked-active');
			$this.html('<img src="' + src + '" alt="checked">');
			$input.checked = true;
		}
	}
	function _checkBoxListener2() {
		var $this = $(this);
		var $input = $this.prev();
		//var $checkedValue = $input.prop('checked');
		
		var $hasFlipped = $this.hasClass('checked-active');
		
		if ($hasFlipped) {
			$this.html('');
			$this.removeClass('checked-active');
		}
		else {
			$this.html('<img src="' + src + '" alt="checked">');
			$this.addClass('checked-active');
		}
		
		$input.checked = true;
		
	}
	
	
	
	//toggle visibility of custom time slots
	function _toggleCustomTimes() {
		$(this).parent().parent().next().toggle();
	}

	//Convert custom time slot labels to links and load up listeners
	function _setUpCustomTimeSlots() {
		var customCtr = 1;
		$('.custom-timeslots').each(function() {
			var $customWrapper = $(this);
			$customWrapper.append('<div class="custom-hidden-checkboxes"/>');
			$(this).find('input[type="checkbox"]').each(function() {
				var $this = $(this), $next = $this.parent().next('.custom-time-slot'), text = $next.html(), checked = '';
				$this.attr('data-id', 'custom-time-' + customCtr);
				if ($this.is(':checked')) {
					checked = ' checked';
				}
				$next.remove();
				$this.parent().after('<a class="custom-time-slot checkbox-button'+checked+'" data-id="custom-time-'+customCtr+'" href="">' + text + '</a>');
				$customWrapper.find('.custom-hidden-checkboxes').append(this);
				customCtr++;
			}); 
			$customWrapper.find('.hidden-checkbox-container').remove();
		});
		$('.custom-time-slot').bind('click', function(e) {
			e.preventDefault();
			var $this = $(this), $input = $('input[data-id="'+$this.attr('data-id')+'"]');
			if ($this.hasClass('checked')) {
				$this.removeClass('checked');
				$input.removeAttr('checked');
			}
			else {
				$this.addClass('checked');
				$input.attr('checked','checked');
			}
		});
	}
}

//About You tab logic
signUp.aboutYou = function() {
	var src = '';

	this.init = function() {
		_setUpCheckBoxes();
	}

	//Set up any checkbox interactivity we need
	function _setUpCheckBoxes() {
		//Only interested in running this on about you sign-up page
		if ($('.container-mentor-onboard.about').length < 1)
		{
			return;
		}

		//set up listener for timeslot links
		$('.checkbox-row .hidden-checkbox-container').each(function() {
			var $this = $(this);
			$this.after('<div class="checkbox"></div>');
			var $fakeBox = $($this.next('.checkbox'));
			var realBox = $this.html();
			$this.remove();
			$fakeBox.next('label').after('<div class="hidden-checkbox-container">' + realBox + '</div>');
		});

		$('.checkbox').bind('click', _checkBoxListener);
		src = $('.checked-src').attr('src');
	}

	//Listener for when .checkbox divs are checked. Add checked icon and alter real checkbox
	function _checkBoxListener() {
		var $this = $(this);
		var $input = $this.siblings('.hidden-checkbox-container').find('input');
		if ($input.attr('checked') == 'checked') {
			$this.html('');
			$input.checked = false;
			$this.removeClass('checked-active');
		}
		else {
			$this.addClass('checked-active');
			$this.html('<img src="' + src + '" alt="checked">');
			$input.checked = true;
		}
	}
}

//Sign Up - Services Code
signUp.services = function() {
	var src = '';

	this.init = function() {
		//Only interested on running this on sign up skills page
		if ($('.container-mentor-onboard.skills').length < 1)
		{
			return;
		}
		_setUpCheckBoxes();
		_setUpRadios();
		_panelGroupCloseListener();
	}

  

	//Set up any checkbox interactivity we need
	function _setUpCheckBoxes() {
		//set up listener for timeslot links
		$('.checkbox').bind('click', _checkBoxListener);
		src = $('.checked-src').attr('src');
	}

	//Hide radios in accordion titles and set listeners to set/unset them as accordions are expanded/condensed
	function _setUpRadios() {
		$('.accordion-toggle-link').bind('click', _titleClickListener);

	}

	//Trigger any effects and alter data based on the accordion titles being clicked
	function _titleClickListener(e) {
		var $this = $(this);
		//If the panel body has class 'in' at the time of the click, it's being closed. 
		if (!$this.parent().parent().next().hasClass('in')) {
			$('#skill-category-id').val($this.data('category-id'));
		} else {
			$('#skill-category-id').val('');

		}
		
	}

	function _panelGroupCloseListener() {
		$('.category-panel-group').on('hidden.bs.collapse', function () {
		  $('div.checkbox').html('');
			$('div.checkbox').removeClass('checked-active');
			$('.skill-category-tag').checked = false;
		});
	}
	
	//Listener for when .checkbox divs are checked. Add checked icon and alter real checkbox
	function _checkBoxListener() {
		var $this = $(this);

		var $input = $this.next().find('input');
		if ($input.is(':checked')) {
			$this.html('');
			$input.checked = false;
			$this.removeClass('checked-active');
		}
		else {
			$this.html('<img src="' + src + '" alt="checked">');
			$input.checked = true;
			$this.addClass('checked-active');
		}
	}
}

$(document).ready(function() {
	var availability = new signUp.availability(), services = new signUp.services(), aboutYou = new signUp.aboutYou();
	availability.init();
	aboutYou.init();
	services.init();
})
