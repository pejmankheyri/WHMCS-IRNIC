{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}
<br><br><br>
<div class="row">
	<div class="form-group col-sm-6">
		<a style="font-size: 18px;" href="irnic-handle-personal.php" class="btn btn-default btn-sm btn-block" title="{$LANG.irnicnewcontactpersonal}"><i class="fa fa-user"></i> {$LANG.irnicnewcontactpersonal}</a>
	</div>
	<div class="form-group col-sm-6">
		<a style="font-size: 18px;" href="irnic-handle-private.php" class="btn btn-default btn-sm btn-block" title="{$LANG.irnicnewcontactorganization}"><i class="fa fa-building"></i> {$LANG.irnicnewcontactorganization}</a>
	</div>
</div>
<div class="row">
	<div class="form-group col-sm-6">
		<a style="font-size: 18px;" href="irnic-handle-edu.php" class="btn btn-default btn-sm btn-block" title="{$LANG.irnicnewcontacteducation}"><i class="fa fa-university"></i> {$LANG.irnicnewcontacteducation}</a>
	</div>
	<div class="form-group col-sm-6">
		<a style="font-size: 18px;" href="irnic-handle-gov.php" class="btn btn-default btn-sm btn-block" title="{$LANG.irnicnewcontactgovernment}"><i class="fa fa-building-o"></i> {$LANG.irnicnewcontactgovernment}</a>
	</div>
</div>

