import { and, not } from "discourse/truth-helpers";
import AccountDeletionRequest from "../../components/account-deletion-request";

export default <template>
  {{#unless this.model.canDeleteAccount}}
    {{#if (not (and (settings.hide_for_staff) this.currentUser.staff))}}
      <div class="control-group account-deletion-request-button">
        <br />
        <div class="controls">
          <AccountDeletionRequest />
        </div>
      </div>
    {{/if}}
  {{/unless}}
</template>
