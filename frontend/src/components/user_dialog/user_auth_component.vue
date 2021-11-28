<script lang="ts">
import {store} from "@/store/store";
import {stringResources} from "@/utils/constants";
import {waitTillActionAndComplete} from "@/utils/utils";
import {useDialog} from "naive-ui";


export default function initAuthDialogActivator() {

  function handleClick() {
    const dialog = useDialog();
    const d = dialog.info({
      title: stringResources.AUTHORIZATION_DIALOG_TITLE,
      content: stringResources.AUTHORIZATION_DIALOG_CONTENT,
      positiveText: stringResources.SIGN_KEYWORD,
      negativeText: stringResources.CANCEL_KEYWORD,
      maskClosable: false,
      onPositiveClick: () => {
        d.loading = true
        // d.closable = false;
        d.content = stringResources.AUTHORIZATION_DIALOG_CONTENT2;
        return store.dispatch("authWithGoogle").then(function () {
          d.destroy();
          console.log(store.state)
        });
      }
    })
  }

  waitTillActionAndComplete('openUserAuth', handleClick);
}
</script>