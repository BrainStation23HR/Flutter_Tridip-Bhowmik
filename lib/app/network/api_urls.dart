// const String websiteDevUrl = "https://suzuki-backend.softbd.xyz";
const String websiteDevUrl = "https://my-suzuki-backend.softbd.xyz";
const String websiteLiveUrl = "";
const String baseImageUrl = "$websiteDevUrl/api/user/media/cdn/";
const String baseUrl = "$websiteDevUrl/api/";

const String registrationUrl = "biker-user/create";
const String loginUrl = "biker-auth/login";
// const String userDetailsUrl = "biker-auth/me";
const String userDetailsUrl = "biker-auth/profile";
const String changePasswordUrl = "biker-auth/change-password";
const String offersUrl = "user/offers/list";
const String warrantyPolicyUrl = "user/warranty-policies";
const String refreshTokenUrl = "biker-auth/refresh-token";
const String regVerifyOtpUrl = "biker-user/verify-otp";
const String registrationResendOtpUrl = "biker-user/resend-otp";
const String temporaryChangePasswordUrl =
    "biker-user/temporary-change-password";

const String addBikeUrl = "bike/create";

String singleBikeInfo(String id) => "bike/$id";
const String getBikeInfoUrl = "bike/get-bike-info";
const String logOutUrl = "user-auth/logout";
const String getAllBikesUrl = "bike";
const String divisionUrl = "area/divisions";

String districtUrl(division) => "area/districts/$division";

String upazilaUrl(division, district) => "area/$division/$district";

String nearestDealerSearchUrl(String division, String district) =>
    "area/dealer/$division/$district";

String serviceHistoryUrl(String bikeId) => "service/$bikeId/history";

String serviceHistoryDetailsUrl(String serviceNo) =>
    "service/$serviceNo/history/details";

String serviceScheduleUrl(String bikeId) => "service/$bikeId/schedule";
const String nearbyDealerUrl = "dealer/nearby";
const String forgetPasswordUrl = "biker-user/forgot-password";
const String forgetPasswordOtpVerifyUrl =
    "biker-user/forgot-password/verify-otp";
const String resetPasswordUrl = "biker-user/reset-password";
const String cmsItemUrl = "user/cms/items";
const String emailVerifyOtpSendUrl = "biker-auth/email/send-otp";
const String emailVerifyOtpVerificationUrl = "biker-auth/email/verify-otp";
const String emailVerificationResendOtpUrl = "biker-auth/email/resend-otp";
const String bikeProfileUpdateUrl = "biker-auth/profile";
const String forgotPasswordResendOtpUrl =
    "biker-user/forgot-password/resend-otp";
const String becameDealerAndContactUsUrl = "user/form-data";
const String bikeModelUrl = "user/products/bike/model";
const String bikeColorUrl = "user/products/bike/color";
const String serviceCategoryOrTypeUrl = "service/all-service-types";
const String serviceBookingUrl = "service-booking/book-slot";
const String servicePackageListUrl = "service/all-package-types";
const String imageUploadUrl = "user/media/upload";

String bikeDocAddUrl(String bikeId) => "user/bike-docs/bike/$bikeId/create";

String bikeDocsUrl(String bikeId) => "user/bike-docs/bike/$bikeId";

String bikeDocsUpdateUrl(String bikeDocId) => "user/bike-docs/$bikeDocId";

String bikeDocsDeleteUrl(String bikeDocId) => "user/bike-docs/$bikeDocId";
const String bikeDocsListUrl = "user/bike-docs";
const String submitFeedbackUrl = "service/post-feedback";
const String tipsSafetyUrl = "user/blogs/tips-and-training";
const String serviceBookedListUrl = "service-booking/list";

String bikeDeleteUrl(String bikeId) => "bike/$bikeId";
