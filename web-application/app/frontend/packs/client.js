import jQuery from 'jquery'; // eslint-disable-line no-unused-vars

const changeClientType = (status) => {
  if (status === false) {
    jQuery('#client_surname').show();
    jQuery('label[for="client_surname"]').show();
  } else {
    jQuery('#client_surname').hide();
    jQuery('label[for="client_surname"]').hide();
  }
  jQuery('#client_type').attr('checked', status);
  jQuery('#private-client-button').prop('disabled', !status);
  jQuery('#public-client-button').prop('disabled', status);
};

const initialValue = jQuery('#client_type').attr('checked');
changeClientType(Boolean(initialValue));

jQuery('#private-client-button').click(() => {
  changeClientType(false);
});

jQuery('#public-client-button').click(() => {
  changeClientType(true);
});

jQuery('#client_type').hide();
jQuery('label[for="client_type"]').hide();
