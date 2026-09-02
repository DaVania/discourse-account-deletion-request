import Component from "@glimmer/component";
import AccountDeletionRequest from "../../components/account-deletion-request";

export default class AccountDeletionRequestConnector extends Component {
  static shouldRender(args, context) {
    return (
      !args.model?.canDeleteAccount &&
      !(settings.hide_for_staff && context.currentUser?.staff)
    );
  }

  <template>
    <div class="control-group account-deletion-request-button">
      <br />
      <div class="controls">
        <AccountDeletionRequest />
      </div>
    </div>
  </template>
}
