var swfu;

window.onload = function() {
  if (!document.getElementById("spanButtonPlaceholder1")) return;
  var settings = {

    flash_url: "/assets/swfupload.swf",
    upload_url: "http://up.qbox.me/upload",
    post_params: {},
    use_query_string: false,
    file_post_name: "file",
    file_size_limit: "10 MB",
    file_types: "*.png;*.jpg;*.jpeg;*.gif",
    file_types_description: "Web Image Files",
    file_upload_limit: 100,
    file_queue_limit: 0,
    custom_settings: {
      fileUniqIdMapping: {},
      progressTarget: "fsUploadProgress",
      cancelButtonId: "btnCancel"
    },
    debug: false,
    preserve_relative_urls: true,

    // Button Settings
    button_image_url: "/assets/XPButtonUploadText_61x22.png",
    button_placeholder_id: "spanButtonPlaceholder1",
    button_width: 61,
    button_height: 22,

    // The event handler functions are defined in handlers.js
    file_queued_handler: fileQueued,
    file_queue_error_handler: fileQueueError,
    file_dialog_complete_handler: fileDialogComplete,
    upload_start_handler: uploadStart,
    upload_progress_handler: uploadProgress,
    upload_error_handler: uploadError,
    upload_success_handler: uploadSuccess,
    upload_complete_handler: uploadComplete,
    queue_complete_handler: queueComplete // Queue plugin event
  };
  
  swfu = new SWFUpload(settings);
};
