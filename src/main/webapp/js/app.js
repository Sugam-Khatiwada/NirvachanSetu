/*
 * NirvachanSetu - Election Management System
 * Main JavaScript Application
 */

(function () {
  'use strict';

  // ========================================
  // DOM READY
  // ========================================

  document.addEventListener('DOMContentLoaded', function () {
    initSidebar();
    initDropdowns();
    initFormValidation();
    initCandidateSearch();
    initCandidateFilter();
    initVoteConfirmation();
    initProfileImagePreview();
    initTableSort();
    initCountdownTimers();
    initPasswordStrength();
    initExpandableCards();
    initRadioCardSelection();
    initSmoothScroll();
    initTooltips();
  });

  // ========================================
  // MOBILE SIDEBAR TOGGLE
  // ========================================

  function initSidebar() {
    const toggleBtn = document.getElementById('sidebar-toggle');
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebar-overlay');
    const closeBtn = document.getElementById('sidebar-close');

    if (!sidebar) return;

    function openSidebar() {
      sidebar.classList.add('sidebar-open');
      if (overlay) overlay.classList.add('sidebar-overlay-active');
      document.body.style.overflow = 'hidden';
    }

    function closeSidebar() {
      sidebar.classList.remove('sidebar-open');
      if (overlay) overlay.classList.remove('sidebar-overlay-active');
      document.body.style.overflow = '';
    }

    if (toggleBtn) {
      toggleBtn.addEventListener('click', openSidebar);
    }

    if (closeBtn) {
      closeBtn.addEventListener('click', closeSidebar);
    }

    if (overlay) {
      overlay.addEventListener('click', closeSidebar);
    }

    // Close sidebar on escape
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        closeSidebar();
        closeAllDropdowns();
      }
    });

    // Handle window resize
    window.addEventListener('resize', function () {
      if (window.innerWidth >= 1024) {
        closeSidebar();
      }
    });
  }

  // ========================================
  // DROPDOWN MENUS
  // ========================================

  function initDropdowns() {
    document.querySelectorAll('[data-dropdown]').forEach(function (trigger) {
      trigger.addEventListener('click', function (e) {
        e.stopPropagation();
        var targetId = this.getAttribute('data-dropdown');
        var menu = document.getElementById(targetId);
        if (!menu) return;

        var isOpen = !menu.classList.contains('hidden');

        closeAllDropdowns();

        if (!isOpen) {
          menu.classList.remove('hidden');
          menu.classList.add('animate-fade-in');
        }
      });
    });

    document.addEventListener('click', function () {
      closeAllDropdowns();
    });
  }

  function closeAllDropdowns() {
    document.querySelectorAll('[data-dropdown-menu]').forEach(function (menu) {
      menu.classList.add('hidden');
      menu.classList.remove('animate-fade-in');
    });
  }

  // ========================================
  // FORM VALIDATION HELPERS
  // ========================================

  function initFormValidation() {
    var forms = document.querySelectorAll('form[data-validate]');

    forms.forEach(function (form) {
      form.addEventListener('submit', function (e) {
        if (!validateForm(form)) {
          e.preventDefault();
          e.stopPropagation();
        }
      });
    });
  }

  function validateForm(form) {
    var isValid = true;
    var firstInvalid = null;

    // Clear previous errors
    form.querySelectorAll('.form-error').forEach(function (el) {
      el.remove();
    });
    form.querySelectorAll('.input-field, .select-field, .textarea-field').forEach(function (el) {
      el.style.borderColor = 'transparent';
    });

    // Required fields
    form.querySelectorAll('[required]').forEach(function (field) {
      if (!field.value.trim()) {
        isValid = false;
        showFieldError(field, 'This field is required');
        if (!firstInvalid) firstInvalid = field;
      }
    });

    // Email validation
    form.querySelectorAll('input[type="email"]').forEach(function (field) {
      if (field.value.trim() && !isValidEmail(field.value.trim())) {
        isValid = false;
        showFieldError(field, 'Please enter a valid email address');
        if (!firstInvalid) firstInvalid = field;
      }
    });

    // Phone validation
    form.querySelectorAll('input[type="tel"]').forEach(function (field) {
      if (field.value.trim() && !isValidPhone(field.value.trim())) {
        isValid = false;
        showFieldError(field, 'Please enter a valid phone number');
        if (!firstInvalid) firstInvalid = field;
      }
    });

    // Min length
    form.querySelectorAll('[minlength]').forEach(function (field) {
      if (field.value.trim() && field.value.trim().length < parseInt(field.getAttribute('minlength'))) {
        isValid = false;
        showFieldError(field, 'Must be at least ' + field.getAttribute('minlength') + ' characters');
        if (!firstInvalid) firstInvalid = field;
      }
    });

    if (firstInvalid) {
      firstInvalid.focus();
    }

    return isValid;
  }

  function showFieldError(field, message) {
    field.style.borderColor = '#ef4444';
    var error = document.createElement('div');
    error.className = 'form-error';
    error.textContent = message;
    field.parentNode.appendChild(error);
  }

  function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }

  function isValidPhone(phone) {
    return /^[\+]?[0-9\s\-\(\)]{7,15}$/.test(phone);
  }

  // ========================================
  // PASSWORD STRENGTH INDICATOR
  // ========================================

  function initPasswordStrength() {
    var passwordInput = document.getElementById('password');
    var strengthBar = document.getElementById('password-strength');
    var strengthText = document.getElementById('password-strength-text');

    if (!passwordInput || !strengthBar) return;

    passwordInput.addEventListener('input', function () {
      var strength = calculatePasswordStrength(this.value);
      updatePasswordStrengthUI(strength, strengthBar, strengthText);
    });
  }

  function calculatePasswordStrength(password) {
    if (!password) return { score: 0, label: '', color: '' };

    var score = 0;
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    if (/[a-z]/.test(password) && /[A-Z]/.test(password)) score++;
    if (/\d/.test(password)) score++;
    if (/[^a-zA-Z0-9]/.test(password)) score++;

    if (score <= 1) return { score: score, label: 'Weak', color: '#ef4444', width: '20%' };
    if (score === 2) return { score: score, label: 'Fair', color: '#f97316', width: '40%' };
    if (score === 3) return { score: score, label: 'Good', color: '#eab308', width: '60%' };
    if (score === 4) return { score: score, label: 'Strong', color: '#22c55e', width: '80%' };
    return { score: score, label: 'Very Strong', color: '#16a34a', width: '100%' };
  }

  function updatePasswordStrengthUI(strength, bar, text) {
    if (!strength.label) {
      bar.style.width = '0%';
      bar.style.background = '#e8eaed';
      text.textContent = '';
      return;
    }

    bar.style.width = strength.width;
    bar.style.background = strength.color;
    text.textContent = strength.label;
    text.style.color = strength.color;
  }

  // ========================================
  // CANDIDATE SEARCH
  // ========================================

  function initCandidateSearch() {
    var searchInput = document.getElementById('candidate-search');
    if (!searchInput) return;

    searchInput.addEventListener('input', debounce(function () {
      var query = this.value.toLowerCase().trim();
      var cards = document.querySelectorAll('[data-candidate-card]');

      cards.forEach(function (card) {
        var name = (card.getAttribute('data-candidate-name') || '').toLowerCase();
        var party = (card.getAttribute('data-candidate-party') || '').toLowerCase();

        if (!query || name.indexOf(query) !== -1 || party.indexOf(query) !== -1) {
          card.style.display = '';
          card.classList.add('animate-fade-in');
        } else {
          card.style.display = 'none';
        }
      });
    }, 300));
  }

  // ========================================
  // CANDIDATE FILTER
  // ========================================

  function initCandidateFilter() {
    var filterSelect = document.getElementById('candidate-filter');
    if (!filterSelect) return;

    filterSelect.addEventListener('change', function () {
      var filterValue = this.value;
      var cards = document.querySelectorAll('[data-candidate-card]');

      cards.forEach(function (card) {
        var partyType = card.getAttribute('data-candidate-party-type') || '';

        if (!filterValue || partyType === filterValue) {
          card.style.display = '';
        } else {
          card.style.display = 'none';
        }
      });
    });
  }

  // ========================================
  // VOTE CONFIRMATION DIALOG
  // ========================================

  function initVoteConfirmation() {
    var voteForm = document.getElementById('vote-form');
    var confirmBtn = document.getElementById('confirm-vote-btn');
    var modalOverlay = document.getElementById('vote-confirm-modal');
    var cancelBtn = document.getElementById('vote-cancel-btn');
    var proceedBtn = document.getElementById('vote-proceed-btn');

    if (!voteForm || !confirmBtn || !modalOverlay) return;

    // Ensure modal is hidden on page load
    modalOverlay.style.display = 'none';

    confirmBtn.addEventListener('click', function (e) {
      e.preventDefault();

      // Check if a candidate is selected
      var selected = voteForm.querySelector('input[name="candidateId"]:checked');
      if (!selected) {
        showNotification('Please select a candidate before confirming your vote.', 'warning');
        return;
      }

      // Get candidate name from the selected card
      var selectedCard = selected.closest('.radio-card');
      var candidateFullName = 'the selected candidate';
      if (selectedCard) {
        var nameEl = selectedCard.querySelector('h4[data-candidate-display-name]');
        if (nameEl) {
          candidateFullName = nameEl.textContent.trim();
        }
      }

      // Update both the inline display and the modal display
      var confirmName = document.getElementById('selected-candidate-name');
      if (confirmName) {
        confirmName.textContent = candidateFullName;
      }
      var modalName = document.getElementById('modal-candidate-name');
      if (modalName) {
        modalName.textContent = candidateFullName;
      }

      // Show confirmation modal using inline style
      modalOverlay.style.display = 'flex';
    });

    if (cancelBtn) {
      cancelBtn.addEventListener('click', function () {
        modalOverlay.style.display = 'none';
      });
    }

    if (proceedBtn) {
      proceedBtn.addEventListener('click', function () {
        modalOverlay.style.display = 'none';
        voteForm.submit();
      });
    }

    // Close on overlay click
    modalOverlay.addEventListener('click', function (e) {
      if (e.target === modalOverlay) {
        modalOverlay.style.display = 'none';
      }
    });
  }

  // ========================================
  // PROFILE IMAGE PREVIEW
  // ========================================

  function initProfileImagePreview() {
    var imageInput = document.getElementById('profile-image-input');
    var imagePreview = document.getElementById('profile-image-preview');

    if (!imageInput || !imagePreview) return;

    imageInput.addEventListener('change', function () {
      var file = this.files[0];
      if (!file) return;

      if (!file.type.startsWith('image/')) {
        showNotification('Please select an image file.', 'error');
        return;
      }

      if (file.size > 5 * 1024 * 1024) {
        showNotification('Image must be less than 5MB.', 'error');
        return;
      }

      var reader = new FileReader();
      reader.onload = function (e) {
        imagePreview.src = e.target.result;
        imagePreview.style.display = 'block';
      };
      reader.readAsDataURL(file);
    });
  }

  // ========================================
  // COUNTDOWN TIMERS
  // ========================================

  function initCountdownTimers() {
    var countdownEls = document.querySelectorAll('[data-countdown]');

    countdownEls.forEach(function (el) {
      var targetDate = el.getAttribute('data-countdown');
      if (!targetDate) return;

      var target = new Date(targetDate).getTime();

      function updateCountdown() {
        var now = new Date().getTime();
        var distance = target - now;

        if (distance < 0) {
          el.innerHTML = '<span class="text-red-500 font-semibold">Election Day has passed</span>';
          return;
        }

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

        el.innerHTML =
          '<span class="metric-number">' + days + '</span> days ' +
          '<span class="text-on-surface-variant">' + hours + 'h ' + minutes + 'm</span>';
      }

      updateCountdown();
      setInterval(updateCountdown, 60000); // Update every minute
    });
  }

  // ========================================
  // TABLE SORT
  // ========================================

  function initTableSort() {
    document.querySelectorAll('[data-sort]').forEach(function (header) {
      header.style.cursor = 'pointer';
      header.addEventListener('click', function () {
        var table = this.closest('table');
        if (!table) return;

        var columnIndex = Array.from(this.parentNode.children).indexOf(this);
        var sortType = this.getAttribute('data-sort'); // 'string', 'number'
        var ascending = !this.classList.contains('sort-asc');

        // Reset sort indicators
        table.querySelectorAll('[data-sort]').forEach(function (th) {
          th.classList.remove('sort-asc', 'sort-desc');
        });

        // Set sort indicator
        this.classList.add(ascending ? 'sort-asc' : 'sort-desc');

        // Sort rows
        var tbody = table.querySelector('tbody');
        if (!tbody) return;

        var rows = Array.from(tbody.querySelectorAll('tr'));

        rows.sort(function (a, b) {
          var aVal = a.children[columnIndex] ? a.children[columnIndex].textContent.trim() : '';
          var bVal = b.children[columnIndex] ? b.children[columnIndex].textContent.trim() : '';

          if (sortType === 'number') {
            aVal = parseFloat(aVal.replace(/[^0-9.-]/g, '')) || 0;
            bVal = parseFloat(bVal.replace(/[^0-9.-]/g, '')) || 0;
            return ascending ? aVal - bVal : bVal - aVal;
          }

          aVal = aVal.toLowerCase();
          bVal = bVal.toLowerCase();
          return ascending ? aVal.localeCompare(bVal) : bVal.localeCompare(aVal);
        });

        rows.forEach(function (row) {
          tbody.appendChild(row);
        });
      });
    });
  }

  // ========================================
  // EXPANDABLE CARDS
  // ========================================

  function initExpandableCards() {
    document.querySelectorAll('[data-expandable]').forEach(function (trigger) {
      trigger.addEventListener('click', function () {
        var targetId = this.getAttribute('data-expandable');
        var target = document.getElementById(targetId);
        if (!target) return;

        var isExpanded = !target.classList.contains('hidden');

        if (isExpanded) {
          target.classList.add('hidden');
          this.classList.remove('expanded');
          var icon = this.querySelector('.expand-icon');
          if (icon) icon.style.transform = 'rotate(0deg)';
        } else {
          target.classList.remove('hidden');
          target.classList.add('animate-fade-in');
          this.classList.add('expanded');
          var icon = this.querySelector('.expand-icon');
          if (icon) icon.style.transform = 'rotate(180deg)';
        }
      });
    });
  }

  // ========================================
  // RADIO CARD SELECTION (for voting page)
  // ========================================

  function initRadioCardSelection() {
    document.querySelectorAll('.radio-card').forEach(function (card) {
      card.addEventListener('click', function () {
        // Remove selection from all cards in the same group
        var name = this.querySelector('input[name="candidateId"]');
        if (!name) return;

        var form = this.closest('form');
        if (!form) return;

        form.querySelectorAll('.radio-card').forEach(function (c) {
          c.classList.remove('radio-card-selected');
        });

        // Select this card
        this.classList.add('radio-card-selected');
        var radio = this.querySelector('input[name="candidateId"]');
        if (radio) radio.checked = true;

        // Update confirmation display
        var displayNameEl = this.querySelector('[data-candidate-display-name]');
        var confirmName = document.getElementById('selected-candidate-name');
        if (displayNameEl && confirmName) {
          confirmName.textContent = displayNameEl.textContent;
        }
      });
    });
  }

  // ========================================
  // SMOOTH SCROLL
  // ========================================

  function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(function (link) {
      link.addEventListener('click', function (e) {
        var targetId = this.getAttribute('href');
        if (targetId === '#') return;

        var target = document.querySelector(targetId);
        if (target) {
          e.preventDefault();
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    });
  }

  // ========================================
  // TOOLTIPS (using data-tooltip attribute)
  // ========================================

  function initTooltips() {
    // CSS handles the tooltip display via ::after pseudo-element
    // This is a no-op but keeps the init pattern consistent
  }

  // ========================================
  // NOTIFICATION SYSTEM
  // ========================================

  function showNotification(message, type) {
    type = type || 'info';

    var container = document.getElementById('notification-container') || createNotificationContainer();

    var notification = document.createElement('div');
    notification.className = 'alert alert-' + type + ' animate-fade-in';
    notification.style.marginBottom = '0.5rem';
    notification.style.maxWidth = '28rem';

    var iconMap = {
      success: '&#10003;',
      error: '&#10007;',
      warning: '&#9888;',
      info: '&#8505;'
    };

    notification.innerHTML =
      '<span style="font-size: 1.25rem; flex-shrink: 0;">' + (iconMap[type] || iconMap.info) + '</span>' +
      '<span>' + message + '</span>' +
      '<button onclick="this.parentElement.remove()" style="margin-left: auto; cursor: pointer; background: none; border: none; font-size: 1.25rem; color: inherit; opacity: 0.7;">&times;</button>';

    container.appendChild(notification);

    // Auto-remove after 5 seconds
    setTimeout(function () {
      if (notification.parentNode) {
        notification.style.opacity = '0';
        notification.style.transform = 'translateX(100%)';
        notification.style.transition = 'all 0.3s ease';
        setTimeout(function () {
          if (notification.parentNode) {
            notification.remove();
          }
        }, 300);
      }
    }, 5000);
  }

  function createNotificationContainer() {
    var container = document.createElement('div');
    container.id = 'notification-container';
    container.style.cssText = 'position: fixed; top: 1rem; right: 1rem; z-index: 100; display: flex; flex-direction: column; gap: 0.5rem;';
    document.body.appendChild(container);
    return container;
  }

  // ========================================
  // DEBOUNCE UTILITY
  // ========================================

  function debounce(func, wait) {
    var timeout;
    return function () {
      var context = this;
      var args = arguments;
      clearTimeout(timeout);
      timeout = setTimeout(function () {
        func.apply(context, args);
      }, wait);
    };
  }

  // ========================================
  // CHARACTER COUNTDOWN
  // ========================================

  function initCharCountdown() {
    document.querySelectorAll('[data-max-chars]').forEach(function (textarea) {
      var maxChars = parseInt(textarea.getAttribute('data-max-chars'));
      var counterId = textarea.getAttribute('data-char-counter');
      var counter = document.getElementById(counterId);

      if (!counter) return;

      function updateCounter() {
        var remaining = maxChars - textarea.value.length;
        counter.textContent = remaining + ' characters remaining';
        if (remaining < 50) {
          counter.style.color = '#ef4444';
        } else if (remaining < 100) {
          counter.style.color = '#f97316';
        } else {
          counter.style.color = '#64748b';
        }
      }

      textarea.addEventListener('input', updateCounter);
      updateCounter();
    });
  }

  // ========================================
  // ELECTION SELECTOR
  // ========================================

  function initElectionSelector() {
    var electionSelect = document.getElementById('election-selector');
    if (!electionSelect) return;

    electionSelect.addEventListener('change', function () {
      var electionId = this.value;
      if (electionId) {
        window.location.href = window.location.pathname + '?electionId=' + electionId;
      }
    });
  }

  // ========================================
  // PRINT RESULTS
  // ========================================

  function printResults() {
    window.print();
  }

  // ========================================
  // CONFIRM ACTION (generic)
  // ========================================

  function confirmAction(message) {
    return window.confirm(message);
  }

  // ========================================
  // FORMAT NUMBERS
  // ========================================

  function formatNumber(num) {
    if (num === null || num === undefined) return '0';
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }

  // ========================================
  // COPY TO CLIPBOARD
  // ========================================

  function copyToClipboard(text) {
    if (navigator.clipboard) {
      navigator.clipboard.writeText(text).then(function () {
        showNotification('Copied to clipboard!', 'success');
      });
    } else {
      // Fallback
      var textarea = document.createElement('textarea');
      textarea.value = text;
      textarea.style.position = 'fixed';
      textarea.style.opacity = '0';
      document.body.appendChild(textarea);
      textarea.select();
      try {
        document.execCommand('copy');
        showNotification('Copied to clipboard!', 'success');
      } catch (e) {
        showNotification('Failed to copy.', 'error');
      }
      document.body.removeChild(textarea);
    }
  }

  // ========================================
  // EXPORT UTILITIES
  // ========================================

  window.NirvachanSetu = {
    showNotification: showNotification,
    validateForm: validateForm,
    confirmAction: confirmAction,
    formatNumber: formatNumber,
    copyToClipboard: copyToClipboard,
    printResults: printResults,
    debounce: debounce,
    closeSidebar: function () {
      var sidebar = document.getElementById('sidebar');
      var overlay = document.getElementById('sidebar-overlay');
      if (sidebar) sidebar.classList.remove('sidebar-open');
      if (overlay) overlay.classList.remove('sidebar-overlay-active');
      document.body.style.overflow = '';
    }
  };

})();
