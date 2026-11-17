import { action, computed } from "@ember/object";
import { service } from "@ember/service";
import { classNames } from "@ember-decorators/component";
import DropdownSelectBoxComponent from "discourse/select-kit/components/dropdown-select-box";
import { selectKitOptions } from "discourse/select-kit/components/select-kit";
import { i18n } from "discourse-i18n";
import AccountDeletionModal from "../components/modal/account-deletion-modal";

@classNames("account-deletion-request")
@selectKitOptions({
  icon: settings.dropdown_button_icon,
  showFullTitle: true,
  autoFilterable: false,
  filterable: false,
  showCaret: true,
  none: themePrefix("account_deletion.dropdown.button_text"),
})
export default class AccountDeletionRequest extends DropdownSelectBoxComponent {
  @service currentUser;
  @service modal;
  @service composer;

  @computed
  get content() {
    const userCanSendPm = this.currentUser?.can_send_private_messages;
    const items = [
      {
        id: "more_info",
        name: i18n(themePrefix("account_deletion.dropdown.info.item_name")),
        description: i18n(
          themePrefix("account_deletion.dropdown.info.item_description")
        ),
        icon: settings.info_dropdown_item_icon,
      },
    ];
    if (userCanSendPm) {
      items.push({
        id: "delete_request",
        name: i18n(themePrefix("account_deletion.dropdown.request.item_name")),
        description: i18n(
          themePrefix("account_deletion.dropdown.request.item_description")
        ),
        icon: settings.request_dropdown_item_icon,
      });
    }
    return items;
  }

  @action
  onChange(id) {
    switch (id) {
      case "delete_request": {
        this.composer.openNewMessage({
          recipients: settings.pm_recipients,
          title: i18n(themePrefix("account_deletion.pm.title")),
          body: i18n(themePrefix("account_deletion.pm.body")),
        });
        break;
      }
      case "more_info": {
        this.modal.show(AccountDeletionModal);
        break;
      }
    }
  }
}
