
 $(document).ready(function () {
 
  $("#registration").validate({

    rules: {
      
      firstname: "required",
      lastname: "required",
      username:"required",
      email: {
        required: true,
        email: true
          },
      password: {
        required: true,
        minlength: 5
        },
      mobile: {
        required: true,
        minlength: 10
        },
        dob:"required",
        qual:"required",
        gender:"required",
        state:"required",
        district:"required",
         autocomplete:"required",
        voterid :{
            required: true,
            minlength :10
        },
        pannum :{
            required : true,
            minlength :10,
            maxlength : 10
        },
        aadharnumber:{
            required : true,
            minlength :12
        },
        bankacc:{
        required :true,
        minlength: 12
    },
         recentimage:{
         required: true,
            extension: "jpg"
    },
         aadharimage:{
            required: true,
            extension: "jpg" 
         },
      panimage:{
         required: true,
            extension: "jpg" 
      },
      voterimage:{
          required: true,
            extension: "jpg"
      },
      certificateimage:{
         required: true,
            extension: "jpg" 
      },
        
      
    },
  
    messages: {
      firstname: "Please enter firstname",
      lastname: "Please enter  lastname",
      username:"Your username  must be 10 characters only",
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
        mobile: {
        required: "Please provide mobile number",
        minlength:  "Mobile number must be 10 numbers"
      },
      email: "Please enter a valid email address",
        dob:"Date of Birth must be required",
        qual:"Please select Qualification",
        gender:"Please select gender",
        addr1:"Please provide Address line 1",
        addr2:"Please provide city",
       state:"Please select state",
         district:"Please select district",
        autocomplete:"Please enter pincode",
        ifsccode:"Please enter IFSC Code",
        aadharnumber:{required:"Please enter Aadhar Number",
                     minlength:"Aadhar Number must be 12 digits"},
        voterid:{
            required:"Please enter Voter card Number",
            minlength:"Votercard must be 10 digits"
        },
        pannum :{
            required:"Please enter Pan Card Number",
            minlength:"Pancard Number must be 10 digits"
        },
        bankacc:{required:"Please enter Bank Account",
                minlength:"Bank Account must greater than 11 digits"},
        
        recentimage:"Please upload jpg format image",
        voterimage:"Please upload jpg format image",
        panimage:"Please upload jpg format image",
        certificateimage:"Please upload jpg format image"
    },
     
       onfocusout: function(element) {
            this.element(element);
        },
   
    submitHandler: function(form) {
      form.submit();
    }
  });
 return false;   
     
   
   
});

    