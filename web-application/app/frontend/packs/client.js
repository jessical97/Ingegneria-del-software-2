import jQuery from 'jquery'; // eslint-disable-line no-unused-vars

jQuery('#private-client-button').prop('disabled', true);
jQuery('#public-client-button').prop('disabled', false);

jQuery('#private-client-button').click(() => {
  jQuery('#client_type').attr('checked', false);
  jQuery('#client_surname').show();
  jQuery('label[for="client_surname"]').show();
  jQuery('#private-client-button').prop('disabled', true);
  jQuery('#public-client-button').prop('disabled', false);
});

jQuery('#public-client-button').click(() => {
  jQuery('#client_type').attr('checked', true);
  jQuery('#client_surname').hide();
  jQuery('label[for="client_surname"]').hide();
  jQuery('#private-client-button').prop('disabled', false);
  jQuery('#public-client-button').prop('disabled', true);
});

jQuery('#client_type').hide();
jQuery('label[for="client_type"]').hide();
