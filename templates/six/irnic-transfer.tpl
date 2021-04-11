{if $IrnicTimeError}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$IrnicTimeError}
{else}
    {if $errormessage}
    	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    {if $successmessage}
    	{include file="$template/includes/alert.tpl" type="success" textcenter=true hide=false additionalClasses="my-custom-class" idname="my-alert" msg=$successmessage}
    {/if}
    <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" role="form">
    	<div class="row domain-add-domain">
    		<div class="col-sm-3 col-xs-12">
    			<button type="submit" class="btn btn-primary btn-block" id="btnCheckAvailability">
    				{$LANG.domainstransfer}
    			</button>
    		</div>
    		<div class="col-sm-9 col-xs-12">
    			<div class="row domains-row">
    				<div class="col-xs-12">
    					<div class="input-group">
    						<input type="text" name="irnictransfer" value="" id="inputDomain" placeholder="example.ir" class="form-control" />
    						<span class="input-group-addon" style="direction: ltr; border: none;">{lang key='orderForm.www'}</span>
    					</div>
    				</div>
    			</div>
    		</div>                
    	</div>
    	<input type="hidden" name="submited" value="ok" />
    </form>
{/if}