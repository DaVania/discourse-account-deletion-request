import { trustHTML } from "@ember/template";
import DModal from "discourse/ui-kit/d-modal";
import { i18n } from "discourse-i18n";

<template>
  <DModal
    @closeModal={{@closeModal}}
    @title={{i18n (themePrefix "account_deletion.modal.header_title")}}
  >
    <:body>
      <div class="account-deletion-modal">
        <h2>{{i18n (themePrefix "account_deletion.modal.title")}}</h2>
        <p>
          {{trustHTML (i18n (themePrefix "account_deletion.modal.description"))}}
        </p>
      </div>
    </:body>
  </DModal>
</template>
