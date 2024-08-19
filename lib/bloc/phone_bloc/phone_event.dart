sealed class PhoneEvent{}

final class SendSMSPhoneEvent extends PhoneEvent{
  String phoneNumber;

  SendSMSPhoneEvent(this.phoneNumber);
}