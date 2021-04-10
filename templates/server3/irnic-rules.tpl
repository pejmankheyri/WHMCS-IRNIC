{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
<br><br><br>
<div class="row">
	<div class="form-group col-sm-12">
		<textarea name="" disabled readonly style="height: 300px; width: 100%;">
			{$LANG.cartdomainscreatenewirnicrulesdesc}
		</textarea>
	</div>
</div>

