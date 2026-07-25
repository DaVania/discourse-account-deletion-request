import { trustHTML } from "@ember/template";
import DModal from "discourse/components/d-modal";
import { i18n } from "discourse-i18n";

export default <template>
  <DModal
    @closeModal={{@closeModal}}
    @title={{i18n (themePrefix "account_deletion.modal.header_title")}}
  >
    <:body>
      <div class="account-deletion-modal">
        <h2>{{i18n (themePrefix "account_deletion.modal.title")}}</h2>
        <p>{{trustHTML
            (i18n (themePrefix "account_deletion.modal.description"))
          }}</p>
      </div>
    </:body>
  </DModal>
</template>
